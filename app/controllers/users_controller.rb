class UsersController < ApplicationController
  before_action :curr_user_self, only: [:update, :edit, :destroy]

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      flash[:success] = "user created"
      redirect_to root_url(@user.id)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      flash[:success] = "user updated"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "#{@user.name} deleted"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def curr_user_self
    @user = User.find(params[:id])
    unless is_current_user?(@user)
      flash[:errors] = ["access denied"]
      redirect_to root_url
    end
  end
end
