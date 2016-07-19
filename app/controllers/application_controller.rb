class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :set_locale
  
  private
  
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def set_locale
    p config.i18n.inspect
    #if logged_in?
      #config.i18n.locale = current_user.locale.to_sym
    #end
    #config.i18n.locale ||= config.i18n.default_locale
  end
end
