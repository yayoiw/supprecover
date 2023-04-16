class EasyMedicalCheckupController < ApplicationController
include EasyMedicalCheckupHelper

  def index
    @user = User.find_by(name: cookies[:name])
    @easy_medical_checkup = EasyMedicalCheckup.new
    @easy_medical_checkup.user_id = @user.id
  end

  def create
    @user = User.find_by(name: cookies[:name])
    @easy_medical_checkup = EasyMedicalCheckup.new(easy_medical_checkup_params)
    @easy_medical_checkup.user_id = @user.id
    if @easy_medical_checkup.save
      redirect_to easy_medical_checkup_path(@easy_medical_checkup.id)
    else
      render :index
    end
  end

  def show
    @user = User.find_by(name: cookies[:name])
    @easy_medical_checkup = EasyMedicalCheckup.find_by(user_id: @user.id)
    @recommended_supplements = @easy_medical_checkup.recommended_supplements
    byebug
  end



  private

  def easy_medical_checkup_params
    params.require(:easy_medical_checkup).permit(:height, :weight, :blood_pressure_up, :blood_pressure_down,
                                                  :total_cholesterol, :hdl_cholesterol, :ldl_cholesterol, :neutral_fat,
                                                  :ast, :alt, :gamma_gtp)
  end
end
