class CreateEgalleries < ActiveRecord::Migration
  def self.up
    create_table :egalleries do |t|
      t.integer :event_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :egalleries
  end
end
