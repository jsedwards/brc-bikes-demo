class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post has been created."
      redirect_to @post 
    else
      flash[:alert] = "Post has not been created."
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post has been updated."
      redirect_to @post
    else
      flash[:alert] = "Post has not been updated."
      render "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end