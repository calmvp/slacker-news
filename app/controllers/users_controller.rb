class UsersController < ApplicationController
  def index
  end
  
  def show
  end

  def new
  @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end
end
