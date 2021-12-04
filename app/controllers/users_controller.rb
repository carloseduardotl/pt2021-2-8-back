class UsersController < ApplicationController
  before_action :authorize_request, except: %i[create forgot reset]
  before_action :find_user, except: %i[create index forgot reset]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user.as_json.merge({ avatar: url_for(@user.avatar), likes: @user.likes, comments: @user.comments, replies: @user.replies}), status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      UserMailer.with(user: @user).welcome_email.deliver_later
      render json: @user.as_json.merge({ avatar: url_for(@user.avatar)}), status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  def forgot
    if params[:email].blank?
      return render json: {error: 'Email not present'}
    end
      user = User.find_by(email: params[:email])
    if user.present?
      user.generate_password_token!
      UserMailer.forgot_password_email(user).deliver_now
      render json: {status: 'ok'}, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end

  def reset
    token = params[:token].to_s
    email = params[:email]
    if token.blank?
      return render json: {error: 'Token not present'}
    end
    if email.blank?
      return render json: {error: 'Email not present'}
    end
    user = User.find_by(email: params[:email])
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        UserMailer.reset_password_email(user).deliver_now
        render json: {status: 'ok'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error: ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    )
  end
end