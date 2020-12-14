class CreatePlateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :plate_appearances do |t|
      t.integer :batter_id
      t.integer :pitcher_id

      t.timestamps
    end
  end
end
