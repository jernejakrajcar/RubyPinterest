class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :protect_from_forgery, raise: false
  
    def github
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
      else
        Rails.logger.info(@user.errors.full_messages)
        session["devise.github_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

    def google_oauth2
     @user = User.from_omniauth(request.env["omniauth.auth"])
     if @user.persisted?
       sign_in_and_redirect @user, event: :authentication
       set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
     else
       session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url, notice: 'User already exists, there was something wrong'
     end
   end


   def failure
     redirect_to root_path, notice: "Somethings wrong"
   end

  end
