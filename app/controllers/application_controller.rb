class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :password_digest
   
  def current_user
    if session[:user_id]
      @current_user ||= Customer.find_by(stripe_id: session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    current_user.nil?
  end

  def password_digest(password)
    BCrypt::Password.create(password)
  end
end
