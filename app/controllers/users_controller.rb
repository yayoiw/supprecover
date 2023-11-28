class UsersController < ApplicationController
  before_action :redirect_unless_name, only: :index
  before_action :blocking_access_before_use, only: :before_use
  before_action :check_agreement, only: :before_use


  def index
    @user = User.find_by(name: session[:name])
  end

  def about;end

  def contact;end

  def before_use
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:name] = @user.name
      redirect_to root_path
    else
      cookies[:agree] = 'true'
      @agree = 'true'
      render :before_use
    end
  end

  def terms_of_use;end

  def privacy_policy;end

  def set_agreement
    cookies[:agree] = 'true'
    head :ok
  end

  private

  def check_agreement
    @agree = cookies[:agree] == 'true'
  end


  def user_params
    params.require(:user).permit(:name)
  end
end
