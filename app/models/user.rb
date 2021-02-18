class User < ApplicationRecord
    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
    has_many :attended_event, foreign_key: "event_attendee_id", class_name: "Event"
    has_many :event_creator, through: :attended_events
end
