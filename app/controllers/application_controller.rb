class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_teacher
  before_action :authenticate_teacher

  private

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end
  def authenticate_teacher
    unless current_teacher
      redirect_to page_path(id: "sign_in")
    end
  end
end
