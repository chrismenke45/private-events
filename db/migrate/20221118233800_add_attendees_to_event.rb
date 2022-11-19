class AddAttendeesToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :attendees, references: :users, foreign_key: { to_table: :users }, null: true
  end
end
