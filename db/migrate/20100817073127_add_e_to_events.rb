class AddEToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :e, :boolean, :default => 0
  end

  def self.down
    remove_column :events, :e
  end
end
