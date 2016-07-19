class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :followers, :followings, :show, :update]
  before_action :check_current_user, only: [:edit, :update]
  
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
    @title = I18n.t("dictionary.words.followers")
    @users = @user.follower_users
    render 'follow'
  end

  def followings
    @title = I18n.t("dictionary.words.followings")
    @users = @user.following_users
    render 'follow'
  end

  
  def edit
  end
  
  def new
    @user = User.new
  end
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)
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
  
  def check_current_user
    redirect_to root_path if current_user != @user
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :url, :region, :description)
  end
end
