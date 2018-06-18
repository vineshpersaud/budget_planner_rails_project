class UsersController < ApplicationController
  
  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    session[:name] = @user.name
    redirect_to controller: 'users', action: 'home'
  end

  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
