class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        set_event
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save

            flash[:success] = "Event created"

            redirect_to '/welcome'

        else

            render :new

        end
        
    end

    def attend

        @event = Event.find(params[:id])
        if @event.attendees.include?(current_user)
            redirect_to @event, notice: "Already on list."
        else
            @event.attendees << current_user
            redirect_to @event
        end
        
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_event
            @event = Event.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def event_params
            params.require(:event).permit(:description, :eventdate)
        end
end
