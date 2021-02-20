class AddEventRefToAttendedEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :attended_events, :event_creator, null: false, foreign_key: { to_table: :events }
  end
end
