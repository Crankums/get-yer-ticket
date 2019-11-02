class ChangeColumnsInTickets < ActiveRecord::Migration[6.0]
  def change
    change_column :tickets, :parts_cost, :integer
    change_column :tickets, :labor_cost, :integer
  end
end
