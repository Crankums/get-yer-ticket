class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.datetime :check_in
      t.datetime :work_start
      t.datetime :due
      t.string :status, :default => "Open"
      t.string :labor
      t.decimal :labor_cost
      t.string :parts
      t.decimal :parts_cost
      t.integer :total_cost
      t.boolean :paid?
      t.timestamps
    end
  end
end
