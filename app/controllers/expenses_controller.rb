class ExpensesController < ApplicationController

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update(expense_params)
      redirect_to event_path(@expense.event.id)
    else
      render :edit
    end
  end

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
