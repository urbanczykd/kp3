# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

egallery = {1 => "pierwsza", 2 => "druga", 3 => "trzecia", 4 => "czwarta", 
            2 => "druga", 3 => "trzecia", 4 => "czwarta"}

egallery.each_pair do |key, value|
  Egallery.create(:event_id => key, :name => value)
end

