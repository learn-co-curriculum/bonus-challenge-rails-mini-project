class CreatePitchers < ActiveRecord::Migration[5.0]
  def change
    create_table :pitchers do |t|
      t.string :name
      t.integer :tier

      t.timestamps
    end
  end
end
