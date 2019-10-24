class AddColumnToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :customer_id, :integer
  end
end
