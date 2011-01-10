class Event < ActiveRecord::Base
  belongs_to :category
  has_many :eventdays
  has_many :sponsorizations
  has_many :sponsors, :through => :sponsorizations
  has_one :place
  has_one :magazine
  has_one :category
  
  attr_accessor :when
  attr_accessor :old_days
  
  	def self.lista(page, magazine)
  		paginate :page => page, :per_page => 15,
    		         :conditions => {:magazine_id => magazine}
    	end

named_scope :date_range, lambda { |*t|
started = Time.now.beginning_of_month
ended = Time.now.end_of_month
    {
:include => :eventdays, :conditions => {:eventdays => {:pday => started .. ended}, :e => true}
    }
  }  
named_scope :wydarzenia, lambda { |*args| 
started = Time.now.beginning_of_month
ended = Time.now.end_of_month
  {:include => :eventdays, :conditions => {:eventdays => {:pday => started .. ended}, :e => true, :place_id => args.first} 
  }
}
named_scope :day_range, lambda { |*t|
  started=t.shift || Time.now.beginning_of_day
  ended=t.shift || started.end_of_day
    {
:include => :eventdays, :conditions => 
{:eventdays => {:pday => started.beginning_of_day .. ended}}, :order => 'pday'
    }
  }  

def to_param
    "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}.html"
  end

end

