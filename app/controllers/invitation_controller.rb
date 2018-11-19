class InvitationsController < ApplicationController
  
  def new
    @invitation.create(invitation_params)
  end
 
 private

  def invitation_params
      params.require(:invitation).permit(:event_id, :guest_id)
  end

end

