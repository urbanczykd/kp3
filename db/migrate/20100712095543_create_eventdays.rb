class CreateEventdays < ActiveRecord::Migration
  def self.up
    create_table :eventdays do |t|
      t.integer :event_id
      t.datetime :pday

      t.timestamps
    end
  end

  def self.down
    drop_table :eventdays
  end
end
