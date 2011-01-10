class CreateMagazines < ActiveRecord::Migration
  def self.up
    create_table :magazines do |t|
      t.datetime :start_date
      t.integer :status, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :magazines
  end
end
