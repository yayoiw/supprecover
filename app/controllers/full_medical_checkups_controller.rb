class FullMedicalCheckupsController < ApplicationController
  before_action :redirect_unless_name
  before_action :set_user
  def new
    @full_medical_checkup = FullMedicalCheckup.new
    @full_medical_checkup.user_id = @user.id
  end

  def create
    input_value = params[:full_medical_checkup][:wbc].to_f
    params[:full_medical_checkup][:wbc] = (input_value * 1000).to_s if input_value % 1 != 0
    @full_medical_checkup = @user.full_medical_checkup || @user.build_full_medical_checkup
    if @full_medical_checkup.update(full_medical_checkup_params)
      redirect_to user_full_medical_checkups_path(@user)
    else
      render :new
    end
  end

  def show
    @full_medical_checkup = FullMedicalCheckup.find_by(user_id: @user.id)
    @easy_medical_checkup = EasyMedicalCheckup.find_by(user_id: @user.id)
    @total_supplements = @full_medical_checkup.total_supplements(@easy_medical_checkup.recommended_supplements,
                                                                 @full_medical_checkup.recommended_supplements)
    @tweet_template = "#{@full_medical_checkup.user.name}さんへのおすすめサプリは、#{@total_supplements.map(&:name).join('、')}です！診断結果をチェックしてみてね！"
    view_context.tweet_truncate
  end

  private

  def full_medical_checkup_params
    params.require(:full_medical_checkup).permit(:fasting_blood_sugar, :hba1c, :urine_sugar, :uric_acid,
                                                 :creatinine, :egfr, :hematocrit, :hemoglobin,
                                                 :rbc, :wbc, :urine_protein).tap do |whitelisted|
      whitelisted[:urine_sugar] = whitelisted[:urine_sugar].to_i
      whitelisted[:urine_protein] = whitelisted[:urine_protein].to_i
    end
  end
end
