class EventSerializer < ActiveModel::Serializer
  attributes :id , :name, :budget
  belongs_to :user, serializer: EventUserSerializer
  has_many :expenses
  belongs_to :guests, serializer: EventGuestSerializer
end
