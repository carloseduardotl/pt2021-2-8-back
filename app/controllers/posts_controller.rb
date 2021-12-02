class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  def tags
    post = Post.find(params[:id])
    render json: post.tags
  end

  def likes
    post = Post.find(params[:id])
    render json: post.likes
  end

  def comments
    post = Post.find(params[:id])
    render json: post.comments
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    render json: @post.as_json.merge({content: @post.content, banner_image: url_for(@post.banner_image), tags: @post.tags}), status: :ok
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render :show, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:name, :content, :views, :banner_image, :tag_ids)
    end
end
