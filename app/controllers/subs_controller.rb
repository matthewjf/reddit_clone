class SubsController < ApplicationController
  before_action :curr_user_mod, only: [:edit, :update, :destroy]
  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      flash[:success] = "sub created"
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end


  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub.update_attributes(sub_params)
    if @sub.save
      flash[:success] = "sub updated"
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def curr_user_mod
    @sub = Sub.find(params[:id])
    unless is_current_user?(@sub.moderator)
      flash[:errors] = ["access denied"]
      redirect_to sub_url(@sub)
    end
  end
end
