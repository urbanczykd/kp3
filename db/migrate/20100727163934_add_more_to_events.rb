class AddMoreToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :more, :text
  end

  def self.down
    remove_column :events, :more
  end
end
