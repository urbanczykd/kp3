class Magazine < ActiveRecord::Base
  has_one :cover
  has_one :eversion
  has_many :events
  has_one :topone
  has_many :videos
  has_many :prints
  has_many :soons
#  acts_as_authentic
  
#  attr_accessor :authenticity_token
end
