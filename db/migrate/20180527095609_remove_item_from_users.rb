class RemoveItemFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :item, :text
  end
end
