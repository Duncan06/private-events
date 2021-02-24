class AddEventRefToInvitations < ActiveRecord::Migration[6.1]
  def change
    add_reference :invitations, :event, null: false, foreign_key: true
  end
end
