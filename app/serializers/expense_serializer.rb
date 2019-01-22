class ExpenseSerializer < ActiveModel::Serializer
  attributes :id ,:name,:cost,:quantity,:event
  #belongs_to :user
end
