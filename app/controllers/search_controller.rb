require 'twitter_search'
class SearchController < ApplicationController

	def welcome
		render 'welcome'
	end

	def search_twitter
		client = TwitterSearch::Client.new(‘Tweetomator‘)
		tweets = client.query(params[:search_text])
		render 'results'
	end
end
