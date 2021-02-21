class User < ApplicationRecord
    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
    has_many :attended_events, foreign_key: :event_creator_id
    has_many :events, through: :attended_events, source: :event_creator
end
