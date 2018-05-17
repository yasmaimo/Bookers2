class AddIndexItemFromUsers < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :item, unique: true
  end
end
