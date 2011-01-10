class CreateSoons < ActiveRecord::Migration
  def self.up
    create_table :soons do |t|
      t.integer :magazine_id
      t.integer :position
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :soons
  end
end
