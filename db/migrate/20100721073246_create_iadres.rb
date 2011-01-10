class CreateIadres < ActiveRecord::Migration
  def self.up
    create_table :iadres do |t|
      t.string :title
      t.string :adres

      t.timestamps
    end
  end

  def self.down
    drop_table :iadres
  end
end
