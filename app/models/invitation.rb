class Invitation < ApplicationRecord
    enum status: [invited: 0, accepted: 1, declined: 2]
    belongs_to :user
    belongs_to :event
end