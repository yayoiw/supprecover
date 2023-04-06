class EasyMedicalCheckupController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @easy_medical_checkup = @user.EasyMedicalCheckup.build
  end

  def create
    @user = User.find(params[:user_id])
    @easy_medical_checkup = @user.EasyMedicalCheckup.build(easy_medical_checkup_params)
  end




  private

  def easy_medical_checkup_params
    params.require(:easy_medical_checkup).permit(:height, :weight, :blood_pressure_up, :blood_pressure_down,
                                                  :total_cholesterol, :hdl_cholesterol, :ldl_cheolesterol, :neutral_fat,
                                                  :ast, :alt, :gamma_gtp)
  end
end
