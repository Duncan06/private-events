class AttendedEvent < ApplicationRecord
    belongs_to :event_creator, class_name: "User"
    belongs_to :attendee, class_name: "Event"
end
