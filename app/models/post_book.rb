class PostBook < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :title, length: { maximum: 20 }
	validates :body, presence: true
	validates :body, length: { maximum: 200 }
end
