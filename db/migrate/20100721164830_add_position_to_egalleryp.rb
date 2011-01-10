class AddPositionToEgalleryp < ActiveRecord::Migration
  def self.up
    add_column :egalleryps, :position, :integer
  end

  def self.down
    remove_column :egalleryps, :position
  end
end
