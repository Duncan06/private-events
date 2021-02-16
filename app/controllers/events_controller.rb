class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)

        @event.creator_id = session[:current_user_id]
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_event
            @event = Event.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
            params.require(:event).permit(:date, :location)
        end
end
