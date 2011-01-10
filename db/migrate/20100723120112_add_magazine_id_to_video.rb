class AddMagazineIdToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :magazine_id, :integer
  end

  def self.down
    remove_column :videos, :magazine_id
  end
end
