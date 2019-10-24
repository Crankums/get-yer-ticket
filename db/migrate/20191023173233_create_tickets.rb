class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.datetime :check_in
      t.datetime :work_start
      t.datetime :due
      t.string :status, :default => "Open"
      t.string :labor
      t.decimal :labor_cost, precision: 10, scale: 2
      t.string :parts
      t.decimal :parts_cost, precision: 10, scale: 2
      t.integer :total_cost, precision: 10, scale: 2
      t.boolean :paid?
      t.timestamps
    end
  end
end
