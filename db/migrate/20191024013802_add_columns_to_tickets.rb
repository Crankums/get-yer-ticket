class AddColumnsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :user_id, :integer
    add_column :tickets, :customer_id, :integer
  end
end
