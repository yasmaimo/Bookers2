class PostBook < ApplicationRecord
	belongs_to :user

	#has_many :users
	has_many :post_comments, dependent: :destroy

	validates :body, length: { maximum: 200 }
end
