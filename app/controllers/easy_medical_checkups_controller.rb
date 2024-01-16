class EasyMedicalCheckupsController < ApplicationController
  before_action :redirect_unless_name
  before_action :set_user
  def new
    @easy_medical_checkup = EasyMedicalCheckup.new
    @easy_medical_checkup.user_id = @user.id
  end

  def create
    @easy_medical_checkup = @user.easy_medical_checkup || @user.build_easy_medical_checkup
    if @easy_medical_checkup.update(easy_medical_checkup_params)
      redirect_to user_easy_medical_checkups_path(@user)
    else
      render :new
    end
  end

  def show
    @easy_medical_checkup = EasyMedicalCheckup.find_by(user_id: @user.id)
    @recommended_supplements_easy = @easy_medical_checkup.recommended_supplements
    supplement_names = @recommended_supplements_easy.map(&:name).join('、')
    @tweet_template = "#{@easy_medical_checkup.user.name}さんへのおすすめサプリは、#{supplement_names}です！診断結果をチェックしてみてね！"
    view_context.tweet_truncate
  end

  private

  def easy_medical_checkup_params
    params.require(:easy_medical_checkup).permit(:height, :weight, :blood_pressure_up, :blood_pressure_down,
                                                 :total_cholesterol, :hdl_cholesterol, :ldl_cholesterol, :neutral_fat,
                                                 :ast, :alt, :gamma_gtp)
  end
end
