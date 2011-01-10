class Video < ActiveRecord::Base
  belongs_to :magazine
  has_attached_file :original
  #, :path => "videos/:original/:id.:extension",

end
