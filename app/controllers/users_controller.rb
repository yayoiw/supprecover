class UsersController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def before_use
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:name] = {
        value: @user.name,
        expires: 1.month.from_now
      }
      redirect_to root_path
    else
      render :before_use
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
