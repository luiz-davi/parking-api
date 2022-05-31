class User < ApplicationRecord
  has_secure_password
  
  acts_as_paranoid

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :email, :phone, uniqueness: true
  validates :email, :phone, presence: true

end
