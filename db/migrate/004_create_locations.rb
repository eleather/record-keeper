class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :title
      t.string :text
      t.integer :location_id
      t.integer :rgt
      t.integer :lft
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
