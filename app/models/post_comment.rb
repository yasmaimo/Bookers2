class PostComment < ApplicationRecord
	belongs_to :user
	belongs_to :post_book

	validates :comment, presence: true
	validates :comment, length: { maximum: 50 }
end
