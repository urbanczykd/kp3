class AddPositionToTopone < ActiveRecord::Migration
  def self.up
    add_column :topones, :position, :integer
  end

  def self.down
    remove_column :topones, :position
  end
end
