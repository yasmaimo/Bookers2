class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [ :name ]

  has_many :post_books
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  validates :password, length: { in: 6..16 }, on: :create
  validates :password, length: { in: 6..16 }, on: :create
  validates :password, length: { in: 6..16 }, on: :update, allow_blank: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["name = :value", { :value => login }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end


end
