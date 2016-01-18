class TeachersController < ApplicationController
  before_action :authenticate_teacher

  def edit

  end

  def update
    if current_teacher.update(teacher_params)
      redirect_to bills_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :first_name,
      :last_name,
      :company_name,
      :company_address,
      :company_status,
      :siret,
      :phone_number,
      :lewagon_name)
  end
end
