class EventsController < ApplicationController
  before_action :set_event, only: [:show,:edit,:update,:destroy]
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to user_event_url(session[:user_id], @event)
    else
      render :new
    end
  end

  def show
    
    @user = User.find(@event.user_id)
    @expense = Expense.new
    @expenses  = @event.expenses.all
    @difference = @event.budget_difference
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to user_event_url(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to users_home_path(session[:id])
  end


  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name,:budget,:users_id)
    end
end
