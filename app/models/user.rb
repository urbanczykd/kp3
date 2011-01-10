class User < ActiveRecord::Base
	acts_as_authentic do |c|
  		c.logged_in_timeout(45.minutes)
	end
	attr_accessible :username, :email, :password, :password_confirmation
	acts_as_list

end
