class Egalleryp < ActiveRecord::Base
#  belongs_to :egallery, :dependent => :destroy
  acts_as_list :scope => :egallery
    
  has_attached_file :photo, :styles => { :small => "150x150>",
                                         :thumb => "300x300>",
                                         :normal => "640x480>",
                                         :big => "800x600>"},
                  :url  => "/galleries/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/galleries/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']


end
