class InvitationsController < ApplicationController

    def create
      @event = Event.find(params[:event_id])
      @invitation = Invitation.new(invitation_params)

      if @invitation.save
        @invitation.invited!
        flash[:notice] = "Invitation sent to user!"
        redirect_to event_path(@event)
      else
        flash[:alert] = "Invite could not be sent."
        redirect_to event_path(@event)
      end
    end

    def update
      @invitation = Invitation.find(params[:id])

      if @invitation && @invitation.invited?
        @invitation.accepted!
        flash[:notice] = "Invitation accepted."
      else
        flash[:notice] = "Name not on list."
      end

      redirect_to root_path
    end

    def destroy
      @event = Event.find(params[:event_id])
      @invitation = Invitation.find(params[:id])

      @invitation.destroy

      redirect_to event_path(@event)
    end

    private 

      def invitation_params
          params.permit(:user_id, :event_id)
      end

end
