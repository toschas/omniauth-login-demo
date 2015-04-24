class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :fetch_current_user
  rescue_from 'ActiveRecord::RecordNotFound', with: Proc.new { |exception|
                                              redirect_to root_path, alert: exception.message
                                            }

  def fetch_current_user
    if Rails.env.development?
      @current_user = User.find_or_initialize_by(name: 'Development User')
      @current_user.save(validate: false)
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def require_user
    redirect_to root_path, alert: 'You must be logged in!' unless @current_user
  end

end
