class CreateArchiwes < ActiveRecord::Migration
  def self.up
    create_table :archiwes do |t|
      t.integer :magazine_id
      t.integer :status
      t.datetime :start_date

      t.timestamps
    end
  end

  def self.down
    drop_table :archiwes
  end
end
