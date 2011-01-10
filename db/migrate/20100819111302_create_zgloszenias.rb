class CreateZgloszenias < ActiveRecord::Migration
  def self.up
    create_table :zgloszenias do |t|
      t.string :name
      t.string :description
      t.string :ticket
      t.string :ticket_price
      t.string :adres
      t.string :street
      t.string :place
      t.string :postcode
      t.string :telephone
      t.string :web
      t.string :person_name
      t.string :person_surname
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :zgloszenias
  end
end
