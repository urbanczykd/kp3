class Cover < ActiveRecord::Base
  belongs_to :magazine, :dependent => :destroy
  #require 'paperclip' #bug? /wystarczyło restartnąć app/

has_attached_file :photo, :styles => { 
                                      :small => "150>",
                                      :thumb => "300>",
                                      :normal => "600>",
                                      :big => "800>"
                                      },
                  :url  => "/covers/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/covers/:id/:style/:basename.:extension"
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['application/pdf','image/jpeg', 'image/png']

end
