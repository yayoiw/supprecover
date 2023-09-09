class UsersController < ApplicationController
  before_action :redirect_unless_name, except: [:before_use, :create, :about, :terms_of_use, :privacy_policy]
  before_action :blocking_access_before_use, only: :before_use
  
  def index;end

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
      render :before_use
    end
  end

  def terms_of_use;end

  def privacy_policy;end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
