class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if user_found_and_authenticated
      log_in
    else
      flash[:errors] = "Invalid login"
      render :new
    end
  end

  private

  def log_in
    session[:user_id] = @user.id
    redirect_to account_path, notice: "Login successful"
  end

  def user_found_and_authenticated
    @user && @user.authenticate(params[:session][:password])
  end
end
