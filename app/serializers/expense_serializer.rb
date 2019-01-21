class ExpenseSerializer < ActiveModel::Serializer
  attributes :id ,:name,:cost,:quantity
  belongs_to :user
end
