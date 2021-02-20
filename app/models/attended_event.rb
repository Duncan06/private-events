class AttendedEvent < ApplicationRecord
    belongs_to :event_creator, class_name: "Event"
    belongs_to :attendee, class_name: "User"
end
