class AddPositionToArchiwe < ActiveRecord::Migration
  def self.up
    add_column :archiwes, :position, :integer
  end

  def self.down
    remove_column :archiwes, :position
  end
end
