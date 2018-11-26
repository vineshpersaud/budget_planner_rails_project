class EventsController < ApplicationController
  before_action :set_event, only: [:show,:edit,:update,:destroy,:deactivate]
  before_action :set_user, only: [:show,:edit,:update,:destroy,:deactivate]
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to user_event_url(@event.user_id, @event)
    else
      render :new
    end
  end

  def show
    @guests = @event.guests
    params[:event_id] = @event.id
    @user = User.find(@event.user_id)
    @expense = Expense.new
    @guest = Guest.new
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
    redirect_to users_home_path(@user)
  end

  def deactivate
    if params[:user_id] = session[:user_id]
      @event.active = !@event.active
      @event.save
      redirect_to user_event_path(@user,@event)
    else  
      redirect_to root_url
    end
  end


  private

    def set_user
      @user = session[:user_id]
    end
  

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name,:budget,:users_id)
    end
end
