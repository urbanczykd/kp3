class Place < ActiveRecord::Base
  has_many :events
  has_one :topone
end
