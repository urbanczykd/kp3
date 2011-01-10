class CreateSponsorizations < ActiveRecord::Migration
  def self.up
    create_table :sponsorizations do |t|
      t.integer :topone_id
      t.integer :event_id
      t.integer :sponsor_id
      t.integer :position
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsorizations
  end
end
