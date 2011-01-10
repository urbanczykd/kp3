class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.integer :topone_id
      t.string :event_id
      t.string :title
      t.string :adres

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
