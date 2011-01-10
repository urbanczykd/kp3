class CreateEversions < ActiveRecord::Migration
  def self.up
    create_table :eversions do |t|
      t.integer :magazine_id

      t.timestamps
    end
  end

  def self.down
    drop_table :eversions
  end
end
