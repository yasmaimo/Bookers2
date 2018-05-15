class AddProfileImageIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :prfile_image_id, :string
  end
end
