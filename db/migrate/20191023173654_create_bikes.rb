class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model_series
      t.string :color
      t.string :size
      t.boolean :here?

      t.timestamps
    end
  end
end
