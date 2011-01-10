class AddMagazineIdToPrint < ActiveRecord::Migration
  def self.up
    add_column :prints, :magazine_id, :integer
  end

  def self.down
    remove_column :prints, :magazine_id
  end
end
