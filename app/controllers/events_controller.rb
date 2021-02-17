class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)

        @event.save

        redirect_to '/welcome'
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_event
            @event = Event.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def event_params
            params.require(:event).permit(:description)
        end
end
