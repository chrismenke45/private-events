class CreateEventsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :enrollments do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end

    add_foreign_key :enrollments, :events, column: :attended_event_id
    add_foreign_key :enrollments, :users, column: :attendee_id
  end
end
