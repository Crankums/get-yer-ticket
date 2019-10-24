class CreateCustomerTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_tickets do |t|
      t.integer :customer_id
      t.integer :ticket_id
      
      t.timestamps
    end
  end
end
