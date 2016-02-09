class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_teacher


  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def pundit_user
    current_teacher
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def authenticate_teacher
    unless current_teacher
      redirect_to page_path(id: "sign_in")
    end
  end
end
