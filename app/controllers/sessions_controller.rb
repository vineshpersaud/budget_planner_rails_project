class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    
    if    request.env['omniauth.auth']
          oauth_email = request.env["omniauth.auth"]["info"]["email"] 
          @user = User.find_or_create_by(email: oauth_email) do |u|
          u.name = request.env["omniauth.auth"]["info"]["name"]
          u.email = request.env["omniauth.auth"]["info"]["email"]
          u.password = SecureRandom.hex
      end
        session[:user_id] = @user.id
        redirect_to users_home_url        
    else
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to controller: 'users', action: 'home'
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
