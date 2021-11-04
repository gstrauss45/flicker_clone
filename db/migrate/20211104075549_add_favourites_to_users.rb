class AddFavouritesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :favourites, :string, array: true, default: []
  end
end
