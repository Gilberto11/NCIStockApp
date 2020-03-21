class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :stocks

  #validates :email, presence: true

  scope :recent, -> {where('created_at > ?', 1.week.ago)}
  has_many :stocks
  validates :email, presence: true

end
