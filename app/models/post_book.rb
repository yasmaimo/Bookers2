class PostBook < ApplicationRecord
	belongs_to :user
	has_many :post_comments, dependent: :destroy

	validates :title, presence: true
	validates :title, length: { maximum: 20 }
	validates :body, presence: true
	validates :body, length: { maximum: 200 }
end
