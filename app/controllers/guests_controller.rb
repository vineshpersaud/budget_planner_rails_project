class GuestsController < ApplicationController
  
  def new
    @guest.new
  end

  def create
    @guest = Guest.find(params[:guest][:id])
    if @guest == nil
      @guest = Guest.new(guest_params)
      @guest.save
    end
    @user_id = session[:user_id]
    @event_id = params[:event_id]
    Invitation.new(event_id: @event_id , guest_id: @guest.id).save
    redirect_to user_event_path(@user_id,@event_id)
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end

end