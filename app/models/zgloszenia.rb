class Zgloszenia < ActiveRecord::Base
validates_presence_of :name, :message => "Pole Nazwa musi być wypełnione!"
validates_presence_of :description, :message => "Pole Opis musi być wypełnione!" 
validates_presence_of :email, :message => "Pole email musi być wypełnione!"
validates_presence_of :person_name, :message => "Pole Adres organizatora: Imie musi być wypełnione!"
validates_presence_of :person_surname, :message => "Pole Adres organizatora: Nazwisko musi być wypełnione!"

  
  
has_attached_file :photo, :styles => { 
                                      :small => "150>",
                                      :thumb => "300>",
                                      :normal => "600>",
                                      :big => "800>"
                                      },
                  :url  => "/zgloszenia/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/zgloszenia/:id/:style/:basename.:extension"
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

end
