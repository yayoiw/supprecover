class FullMedicalCheckupsController < ApplicationController
  before_action :redirect_unless_name
  before_action :set_user
  def new
    if @user.easy_medical_checkup.nil?
      flash[:alert] = "簡易版の診断を先に完了してください。"
      redirect_to new_user_easy_medical_checkups(@user)
    end
    @full_medical_checkup = FullMedicalCheckup.new
    @full_medical_checkup.user_id = @user.id
  end

  def create
  end

  def update
  end

  def show
  end

  private

  def full_medical_checkup_params
    params.require(:full_medical_checkup).permit(:fasting_blood_sugar, :hba1c, :urine_sugar, :uric_acid,
                                                  :creatinine, :egfr, :hematocrit, :hemoglobin,
                                                  :rbc, :wbc, :urine_protein)
  end
end
