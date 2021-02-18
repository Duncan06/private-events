class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendee, class_name: "User"
    has_many :attendee, through: :attended_events, source: :event_creator
end
