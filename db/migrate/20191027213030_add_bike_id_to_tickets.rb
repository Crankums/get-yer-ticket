class AddBikeIdToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :bike_id, :integer
  end
end
