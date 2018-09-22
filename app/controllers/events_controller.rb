class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
    @expense = Expense.new
    @expenses  = @event.expenses.all
    @difference = @event.budget_difference
  end

  def edit
  end


  private

    def event_params
      params.require(:event).permit(:name,:budget,:users_id)
    end
end
