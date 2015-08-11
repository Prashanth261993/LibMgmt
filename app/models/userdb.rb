class Userdb < ActiveRecord::Base
	has_many :books
	has_many :activities
end
