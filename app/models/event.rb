class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitations
    has_many :event_attendances, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendances
    scope :past, -> { where('eventdate < ?', Date.today) }
    scope :future, -> { where('eventdate > ?', Date.today) }
end
 