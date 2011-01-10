class AddMiejscaToMagazines < ActiveRecord::Migration
  def self.up
    add_column :magazines, :miejsca, :string
  end

  def self.down
  end
end
