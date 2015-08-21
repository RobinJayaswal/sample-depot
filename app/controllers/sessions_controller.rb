class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    logger.info "pressed create"
    if User.count != 0
      user = User.find_by_name(params[:name])
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admins_url
      else
        redirect_to login_url, notice: "Incorrect Login"
      end
    else
      logger.info "User count is zero, sending to users controller"
      redirect_to url_for(:controller => :users, :action => :create, :name => params[:name], :password => params[:password], :password_confirmation => params[:password])
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end
end
