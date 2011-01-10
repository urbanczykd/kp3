class AddMiejsceToMagazines < ActiveRecord::Migration
  def self.up
    add_column :magazines, :miejsce, :string
  end

  def self.down
    remove_column :magazines, :miejsce
  end
end
