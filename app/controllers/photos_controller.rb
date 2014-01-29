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

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:notice] = "Photo has been updated."
      redirect_to [@post, @photo]
    else
      flash[:alert] = "Photo has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Photo has been deleted."
    redirect_to @post 
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_photo
    @photo = @post.photos.find(params[:id])
  end
end