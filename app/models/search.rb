class Search < ActiveRecord::Base

	field :query
	field :results, type: Array, defualt: Array.new

	belongs_to :user

	

end
