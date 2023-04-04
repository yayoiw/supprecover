class ApplicationController < ActionController::Base
  before_action :set_name
  before_action :redirect_unless_name

  private

  def set_name
    cookies[:name] ||= false
  end

  def redirect_unless_name
    unless cookies[:name]
      redirect_to before_use_path
    end
  end
end
