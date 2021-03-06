class UsersController < ApplicationController
  before_filter :require_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      AppMailer.send_welcome_email(@user).deliver
      redirect_to sign_in_path
    else
      render :new
    end
  end
  
  def show
    @user = User.where(id: params[:id]).first
  end

  private
    
  def user_params
    params.require(:user).permit(:email, :password, :full_name)
  end
  
end
