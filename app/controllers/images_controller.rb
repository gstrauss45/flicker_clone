class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    @image.image.attach(params[:image][:image])
    @image.email = current_user.email
    @image.save
    redirect_to root_path
  end

  def show
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @image
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:image).permit(:title, :image)
  end
end
