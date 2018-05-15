class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :post_books
  has_many :post_comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }


end
