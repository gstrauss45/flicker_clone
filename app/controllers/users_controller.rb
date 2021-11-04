class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tagged_images = Image.all.map  { |div| if div.users.where(id: current_user.id)
                                                  div
                                                end
                                        }
    @favourites = @user.favourites.map { |id| Image.find(id) }
  end

  def favourite
    if !current_user.favourites.include? (params[:id])
      current_user.favourites.append(params[:id])
      current_user.save
    end
    redirect_to root_path
  end
end
