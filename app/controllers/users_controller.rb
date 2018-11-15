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
    @errors = @user.errors.full_messages
      if @user.save
        session[:user_id] = @user.id
        redirect_to users_home_path
      else 
        # use render to keep @user data
        render :signup,:flash => { :alert => @user.errors.full_messages }
      end
  end

  def home
    @user = User.find(session[:user_id])
    @events = @user.events.all
    @ended_events = Event.over.map {|event|  event if event.user_id == @user.id && event}.compact
  end

  def shoppinglist
    @user = User.find(session[:user_id])
    @expenses = @user.expenses
  end

  private

  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

end
