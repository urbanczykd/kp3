class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :place_id
      t.integer :category_id
      t.integer :magazine_id
      t.time :start_time
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
