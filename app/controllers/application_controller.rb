class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  private

  def redirect_unless_name
    unless session[:name].present?
      redirect_to before_use_path, warning: t('.warning.no_name')
    end
  end

  def blocking_access_before_use
    if session[:name].present?
      redirect_to root_path, warning: t('.warning.name_exist')
    end
  end

  def set_user
    @user = User.find_by(name: session[:name])
  end

end
