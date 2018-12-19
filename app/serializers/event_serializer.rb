class EventSerializer < ActiveModel::Serializer
  attributes :id , :name,:budget
  belongs_to :user, serializer: EventUserSerializer
end
