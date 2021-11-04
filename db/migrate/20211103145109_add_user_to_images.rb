class AddUserToImages < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :image, foreign_key: true
  end
end
