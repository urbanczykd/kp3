class CreateTopones < ActiveRecord::Migration
  def self.up
    create_table :topones do |t|
      t.integer :magazine_id
      t.integer :category_id
      t.integer :place_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :topones
  end
end
