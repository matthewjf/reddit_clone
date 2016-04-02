class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:session][:username], params[:session][:password])
    if user
      flash[:success] = "logged in successfully"
      login!(user)
      redirect_to root_url
    else
      @username = params[:session][:username]
      flash.now[:errors] = ["invalid credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to root_url
  end
end
