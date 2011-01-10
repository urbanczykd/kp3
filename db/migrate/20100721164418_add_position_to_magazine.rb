class AddPositionToMagazine < ActiveRecord::Migration
  def self.up
    add_column :magazines, :position, :integer
  end

  def self.down
    remove_column :magazines, :position
  end
end
