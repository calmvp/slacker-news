class SessionsController < ApplicationController
  def new
    render "sign_in"
  end

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
