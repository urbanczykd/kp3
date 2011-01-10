class Egallery < ActiveRecord::Base
  belongs_to :event
  has_many :egalleryps, :dependent => :destroy # ???
#  acts_as_list
end
