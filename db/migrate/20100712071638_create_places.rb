class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :title
      t.string :name
      t.text :adres
      t.string :telephone
      t.string :email
      t.string :web
      t.text :more

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
