class Sponsor < ActiveRecord::Base
#  belongs_to :event
#  belongs_to :topone

  has_many :categorizations
  has_many :topones, :through => :sponsorizations
  has_many :events, :through => :sponsorizations
  acts_as_list :scope => :topone
  
    has_attached_file :photo, :styles => { :vsmall => "70x70>",
                                           :small => "150x150>",
                                           :thumb => "300x300>",
                                           :normal => "640x480>",
                                           :big => "800x600>"},
                  :url  => "/loga/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/loga/:id/:style/:basename.:extension"

#validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
