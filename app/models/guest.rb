class Guest < ApplicationRecord
  has_many :invitations
  has_many :events, through: :invitations
end
