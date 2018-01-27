class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = "You are logged in."
      redirect_to root_path
    else
      flash.now[:danger] = 'Wrong email or password'
      render 'new'
    end
  end
end
