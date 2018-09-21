class ExpensesController < ApplicationController


  def create
    @expense = Expense.create(expense_params)
    @expense.save
    redirect_to event_path(@expense.event_id)
  end

  private

  def expense_params
     params.require(:expense).permit(:name,:cost,:quantity,:event_id)
  end
end
