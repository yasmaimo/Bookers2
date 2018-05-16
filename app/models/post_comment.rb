class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post_book

	validates :post_comment, presence: true
	validates :post_comment, length: { maximum: 50 }
end
