class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  # include ActionController::Helpers

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  # helper_method :current_user
end
