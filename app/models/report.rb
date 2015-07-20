class Report < ActiveRecord::Base
	INCIDENT_TYPE = [['Road Hazard', 'road_hazard'], ['Theft', 'theft'], ['Event', 'event']]
	FEED = [['Nashville', 'nashville'], ['Memphis', 'memphis'], ['Knoxville', 'knoxville'], ['Chattanooga', 'chattanooga'], ['Tri Cities', 'tri_cities'], ['US Bike Route 23', 'usbr23'], ['US Bike Route 21', 'usbr21'], ['US Bike Route 80', 'usbr80']]

	before_save :set_oauth_tokens

	after_create :tweet

	private

	def set_oauth_tokens
		if self.feed == 'nashville'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'memphis'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'knoxville'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'chattanooga'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'tri-cities'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'usbr23'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'usbr21'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		elsif self.feed == 'usbr80'
			oauth_token 				= "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
			oauth_token_secret  = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		end
	end

	def tweet
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "IYobBOTNVSTTIUyxWvfQpfHlA"
		  config.consumer_secret     = "kujonhkJuVuyLkkPATE9uOFY5mqOvCJV9cSQfXENpWTQZNi0fB"
		  config.oauth_token         = oauth_token
		  config.oauth_token_secret  = oauth_token_secret
		end
		client.update(self.feed.titleize + " " + self.incident_type.titleize + " ALERT: " + self.body)
	end
end
