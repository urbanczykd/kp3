class Topone < ActiveRecord::Base
  belongs_to :category
  belongs_to :magazine
  belongs_to :place
  has_many :sponsorizations
  has_many :sponsors, :through => :sponsorizations

  acts_as_list :scope => :magazine
end
