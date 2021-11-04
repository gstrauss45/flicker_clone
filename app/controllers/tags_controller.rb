class TagsController < ApplicationController
  def new
    @array = User.all.map { |div| [div.email, div.id] }
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.create(image_params)
    @image.image.attach(params[:image][:image])
    @image.save
    redirect_to root_path
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
    @tag = User.find(params[:t_id])
    @array = User.all.map { |div| [div.email, div.id] }
  end

  def add_tag
    @image = Image.find(params[:image_id])
    @image.users.append(User.find(params[:tag_id]))
    @image.save
    redirect_to root_path
  end

  def edit_tag
    @image = Image.find(params[:image_id])
    @image.users.find(params[:old_tag_id]).email = (params[:tag_id])
    @image.save
    redirect_to root_path
  end

  private
  def tag_params
    params.require(:image).permit(:title, :user)
  end
end
