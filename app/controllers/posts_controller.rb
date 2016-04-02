class PostsController < ApplicationController
  before_action :curr_user_author, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:success] = "post created"
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end


  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end

  def update
    @post.update_attributes(post_params)
    if @post.save
      flash[:success] = "post updated"
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_ids)
  end

  def curr_user_author
    @post = Post.find(params[:id])
    unless is_current_user?(@post.author)
      flash[:errors] = ["access denied"]
      redirect_to post_url(@post)
    end
  end
end
