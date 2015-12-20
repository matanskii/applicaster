class Search < ActiveRecord::Base
	
	# Table fields:
	# query (string)
	# results (string?)

	belongs_to :user
	serialize :results, Array

end
