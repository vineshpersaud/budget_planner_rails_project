class Event < ApplicationRecord
 belongs_to :user
 has_many :expenses

 validates :name, presence: true
 validates :budget , numericality: { greater_than_or_equal_to: 1 }

  def budget_difference
    expenses_array = self.expenses.collect { |event| event.total }
    expenses_total = expenses_array.inject(0){|sum,x| sum + x }
    return self.budget - expenses_total 
  end
end
