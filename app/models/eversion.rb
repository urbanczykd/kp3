class Eversion < ActiveRecord::Base
belongs_to :magazine, :dependent => :destroy

has_attached_file :pdf,
                  :url  => "/eversions/:id/:basename.:extension",
                  :path => ":rails_root/public/eversions/:id/:basename.:extension"
validates_attachment_size :pdf, :less_than => 5.megabytes
validates_attachment_content_type :pdf, :content_type => ['application/pdf']
end

#['image/jpeg', 'image/png']
