class CreateEgalleryps < ActiveRecord::Migration
  def self.up
    create_table :egalleryps do |t|
      t.integer :egallery_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :egalleryps
  end
end
