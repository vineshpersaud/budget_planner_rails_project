class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit,:update,:destroy]
  before_action :set_user_id, only: [:edit,:update,:destroy]

  def edit
  end

  def update
    
    if @expense.update(expense_params)
      redirect_to event_path(@expense.event.id)
    else
      render :edit
    end
  end

  def create
    @expense = Expense.create(expense_params)
    @expense.save
    redirect_to user_event_path(@user_id,@expense.event_id),:flash => { :alert => @expense.errors.full_messages }
  end

  def destroy
    @event = @expense.event_id
    @expense.destroy
    redirect_to user_event_path(@user_id,@event)
  end

  private


  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_user_id
    @user_id = session[:user_id]
  end
  
  def expense_params
     params.require(:expense).permit(:name,:cost,:quantity,:event_id)
  end
end
