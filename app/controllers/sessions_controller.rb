class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    User.destroy_all
    if User.count.zero?
      user = User.create(name: params[:name], password: params[:password], password_confirmation: params[:password])
    else
      user = User.authenticate(name: params[:name], password: params[:password])
    end
    if user
        session[:user_id] = user.id
        redirect_to admins_url
    else
        redirect_to login_url, notice: "Incorrect Login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
