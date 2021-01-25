class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

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
       sign_in_and_redirect @user, :event => :authentication
       set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
     else
       session["devise.google_oauth2_data"] = request.env["omniauth.auth"].except("extra")
       redirect_to root_path, notice: 'Napaka pri prijavi, uporabnik že obstaja!'
     end
   end


   def failure
     redirect_to root_path
   end
  end
