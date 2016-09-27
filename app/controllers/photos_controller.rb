class PhotosController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @photos = Photo.all.ordered
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photos_params)

    if @photo.save
      redirect_to photos_path, notice: "Photo saved"
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photos_params)
      redirect_to photos_path, notice: "Photo updated"
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy
    redirect_to photos_path, notice: "Photo deleted"
  end

  private
    def photos_params
      params.require(:photo).permit(:title, :text, :img_url)
    end
end
