class AddItemToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :item, :text
  end
end
