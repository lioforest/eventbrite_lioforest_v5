class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :is_the_same_user?, only: [:show]

	def show
		@user = User.find(params[:id])
	end

end

private

def is_the_same_user?
  @user = User.find(params[:id])
  if user_signed_in?
    unless current_user.id == @user.id
      flash[:danger] = "You cannot access a user page which is not yours"
      redirect_back fallback_location: root_path
    end
  else
    flash[:danger] = "You have to be logged to do this action"
    redirect_back fallback_location:root_path
  end
end