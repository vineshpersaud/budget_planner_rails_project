class UsersController < ApplicationController
  
  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'home'
    else
      redirect_to controller: 'users', action: 'signup'
    end
  end

  def home
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

end
