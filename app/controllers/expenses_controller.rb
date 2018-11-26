class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit,:update,:destroy]
  before_action :set_user, only: [:edit,:update,:destroy,:create]

  def edit
  end

  def update
    if params[:user_id] = session[:user_id]
      if @expense.update(expense_params)
        redirect_to user_event_path(@user,@expense.event.id)
      else
        render :edit
      end
    else
      redirect_to root_url
    end
  end

  def create
    if params[:user_id] = session[:user_id]
      @event =  Event.find(params[:expense][:event_id])
      @expense = @event.expenses.build(expense_params)
      @expense.save
      redirect_to user_event_path(@user,@expense.event_id),:flash => { :alert => @expense.errors.full_messages }
    else
      redirect_to root_url 
    end
  end

  def destroy
    if params[:user_id] = session[:user_id]
      @event = @expense.event_id
      @expense.destroy
      redirect_to user_event_path(@user,@event)
    else
      redirect_to root_url
    end
  end

  private


  def set_expense
    @expense = Expense.find(params[:id])
  end

  def set_user
    @user = session[:user_id]
  end
  
  def expense_params
     params.require(:expense).permit(:name,:cost,:quantity,:event_id)
  end
end
