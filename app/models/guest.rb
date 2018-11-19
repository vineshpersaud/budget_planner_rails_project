class Guest < ApplicationRecord
  has_many :invitations
  has_many :events, through: :invitations

  scope :ordered_by_name,-> {order(name: :asc)}
end
