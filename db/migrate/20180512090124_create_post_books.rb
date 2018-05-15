class CreatePostBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :post_books do |t|
      t.text :title
      t.text :body
      t.text :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
