class CreateLocationGraphEdges < ActiveRecord::Migration
  def self.up
    create_table :location_graph_edges do |t|
      t.integer :location1
      t.integer :location2
      t.string :transition_note

      t.timestamps
    end
  end

  def self.down
    drop_table :location_graph_edges
  end
end
