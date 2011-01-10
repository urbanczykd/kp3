class AddPositionToIadres < ActiveRecord::Migration
  def self.up
    add_column :iadres, :position, :integer
  end

  def self.down
    remove_column :iadres, :position
  end
end
