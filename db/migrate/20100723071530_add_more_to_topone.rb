class AddMoreToTopone < ActiveRecord::Migration
  def self.up
    add_column :topones, :more, :text
  end

  def self.down
    remove_column :topones, :more
  end
end
