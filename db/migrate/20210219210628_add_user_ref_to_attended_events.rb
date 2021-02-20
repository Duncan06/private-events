class AddUserRefToAttendedEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :attended_events, :attendee, null: false, foreign_key: { to_table: :users }
  end
end
