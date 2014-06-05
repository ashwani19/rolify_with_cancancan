class UsersController < ApplicationController
  def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  @user.before_add_method(params[:role])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end
private

def user_params
  params.require(:user).permit(:name, :password, :email,:password_confirmation)
end
end
