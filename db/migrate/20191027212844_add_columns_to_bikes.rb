class AddColumnsToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :ticket_id, :integer
  end
end
