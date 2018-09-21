class UsersController < ApplicationController
  
  def signup
    if logged_in?
      redirect_to users_home_url
    else
      @user = User.new
    end
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
    @events = @user.events.all
  end

  private

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

end
