class AddUserToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :host, references: :users, foreign_key: { to_table: :users }, null: false
  end
end
