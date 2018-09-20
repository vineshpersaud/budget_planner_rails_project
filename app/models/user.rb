class User < ApplicationRecord
  has_many :events
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password_digest, :presence => true
  validates :email, :uniqueness => true 
  has_secure_password
end
