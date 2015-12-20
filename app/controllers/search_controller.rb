 require 'twitter'
 class SearchController < ApplicationController

	def welcome
		render 'welcome'
	end

	def search_twitter
		binding.pry
		params = search_params

		#TODO move to application_controller
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "UZ13uS8QRgcs6wwk6ALjgBO6D"
		  config.consumer_secret     = "XWthniNCrugaJzE2otKG8hHCaM8yJCdFOYJIoeIvfToTBRqhah"
		  config.access_token        = "4501808979-vJPDaFSmmAXa5iXnlkUbo9sFxINbsMrocukgwjT"
		  config.access_token_secret = "mkSHMkGtCUHvWwEiHv90esflqmf9mLO8Fa9oBkemAzb53"
		end

		@tweets = []
		client.search(params[:query], :result_type => "recent").take(20).each do |tweet|
			retweet = tweet.text.split[0]=="RT"
			components = {
				user: retweet ? tweet.text.split[1] : tweet.text.split[0],
				tweet: tweet.text[tweet.text.index(":").to_i+2..-1],
				retweet: retweet
			}
			@tweets << components
		end
		render 'results'
	end

	def search_params
		params.permit(:search=>[:username, :query])[:search]
	end
end
