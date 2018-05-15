class RenamePrfileImageIdColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :prfile_image_id, :profile_image_id
  end
end
