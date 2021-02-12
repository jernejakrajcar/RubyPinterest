class UsersController < ApplicationController

  skip_before_action :protect_from_forgery, raise: false

   def show
   end

   def update
     if current_user.update_attributes(user_params)
       render :show
     else
       render json: { errors: current_user.errors }, status: :unprocessable_entity
     end
   end

  private

  def user_params
   params.require(:user).permit(:username, :email, :password, :bio, :image)
  end

  def auth
    request.env['omniauth.auth']
  end
end
