class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.datetime :check_in
      t.datetime :work_start
      t.datetime :due
      t.string :status
      t.string :labor
      t.string :parts
      t.integer :cost
      t.timestamps
    end
  end
end
