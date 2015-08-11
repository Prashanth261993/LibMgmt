class Book < ActiveRecord::Base
	attr_accessor :due_date
	belongs_to :userdb

	def self.search(search)
      if search
        where('title LIKE ? OR author LIKE ?', "%#{search}%","%#{search}%")
      else
        scoped
      end
  end
end
