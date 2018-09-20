class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end


  private

    def event_params
      params.require(:event).permit(:name,:budget)
    end
end
