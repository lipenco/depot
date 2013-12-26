class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to lofin_url, aler: "invalid user name or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "logged out"
  end
end
