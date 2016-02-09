class SessionsController < ApplicationController
  skip_after_action :verify_authorized

  def create
    auth = request.env["omniauth.auth"]
    teacher = Teacher.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Teacher.create_with_omniauth(auth)
    session[:teacher_id] = teacher.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to page_path(id: "sign_in"), :notice => "Signed out!"
  end
end
