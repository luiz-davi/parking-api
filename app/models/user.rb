class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  
  validates :email, :phone, uniqueness: true
  validates :email, :phone, presence: true
end
