class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    current_user.present?
  end
  def authenticate_user!
    redirect_to login_path, alert: 'ログインが必要です' unless current_user
  end
end
