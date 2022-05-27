class User < ApplicationRecord
  has_secure_password
  
  validates :email, :phone, uniqueness: true
  validates :email, :phone, presence: true
end
