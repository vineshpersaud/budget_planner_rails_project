class EventSerializer < ActiveModel::Serializer
  attributes :id , :name, :budget
  belongs_to :user, serializer: EventUserSerializer
  #belongs_to :guest, serializer: EventGuestSerializer
end
