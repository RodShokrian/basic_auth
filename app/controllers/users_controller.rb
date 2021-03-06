class UsersController < ApplicationController

  before_action :redirect_if_logged_in

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      # redirect_to session_url(user_params)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end



end
