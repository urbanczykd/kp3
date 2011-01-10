class Sponsorization < ActiveRecord::Base
  belongs_to :topone
  belongs_to :event
  belongs_to :sponsor
  acts_as_list

end
