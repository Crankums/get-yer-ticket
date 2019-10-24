class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer :ticket_id
      t.integer :customer_id
      t.integer :user_id
      t.timestamps
    end
  end
end
