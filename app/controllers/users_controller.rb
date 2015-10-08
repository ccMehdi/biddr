class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      redirect_to new_user_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit([:email_address, :password, :password_confirmtion])
  end

end