class InvitationsController < ApplicationController

    def new
      @invitation = Invitation.new
    end

    def create
      @invitation = Inviation.new(initation_params)

      if invitation.save
        invitation.invited!
        flash[:notice] = "Invitation sent to user!"
        redirect_to @event
      else
        flash[:alert] = "Invite could not be sent."
        redirect_to @event
      end
    end

    def destroy
    end

    private 

      def invitation_params
          params.require(:inviation).permit(:user_id, :event_id)
      end

end
