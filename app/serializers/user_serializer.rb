class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :events
  has_many :expenses, through: :events
end
