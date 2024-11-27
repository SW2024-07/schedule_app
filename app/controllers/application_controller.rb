class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  private
  def current_user
    if session[:login_uid]
      User.find_by(uid: session[:login_uid])
    end
  end
  
  def logged_in?
    current_user.present?
  end
  
end
