class PhotosController < ApplicationController
  before_action :set_post
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def new
    @photo = @post.photos.build
  end

  def create
    @photo = @post.photos.build(photo_params)
    if @photo.save
      flash[:notice] = "Photo has been added."
      redirect_to [@post, @photo]
    else
      flash[:alert] = "Photo has not been added."
      render "new"
    end
  end

  def show
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_photo
    @photo = @post.photos.find(params[:id])
  end
end