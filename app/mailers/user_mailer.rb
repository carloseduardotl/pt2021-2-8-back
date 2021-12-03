class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        attachments['cat.gif'] = File.read('app/assets/images/giphy.gif')
        mail(to: @user.email, subject: "[BEM VINDO(A) AO PETGATÔ]")
    end

    def forgot_password_email(user)
        @user = user
        mail(to: @user.email, subject: "[ALTERAR MINHA SENHA]")
    end

    def reset_password_email(user)
        @user = user
        mail(to: @user.email, subject: "[NOVA SENHA]")
    end
end
