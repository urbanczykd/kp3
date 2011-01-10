class Soon < ActiveRecord::Base
  belongs_to :magazine
  acts_as_list :scope => :magazine
end
