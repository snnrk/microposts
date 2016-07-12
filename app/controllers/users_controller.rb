class UsersController < ApplicationController
  before_action :set_user, only: [:followers, :followings, :show]
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def followers
  end

  def followings
  end

  def new
    @user = User.new
  end
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
