class CreateBatters < ActiveRecord::Migration[5.0]
  def change
    create_table :batters do |t|
      t.string :name
      t.integer :tier

      t.timestamps
    end
  end
end
