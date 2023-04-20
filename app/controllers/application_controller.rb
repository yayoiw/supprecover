class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  private

  def redirect_unless_name
    unless session[:name].present?
      redirect_to before_use_path, success: '名前を登録してください'
    end
  end

  def blocking_access_before_use
    if session[:name].present?
      redirect_to root_path, success: '既に名前は登録済みです'
    end
  end

end
