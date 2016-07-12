class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Updated."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :url, :region, :description)
  end
end
