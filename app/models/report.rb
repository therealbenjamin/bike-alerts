class Report < ActiveRecord::Base
	INCIDENT_TYPE = [['Road Hazard', 'road_hazard'], ['Theft', 'theft'], ['Event', 'event']]
	FEED = [['Nashville', 'nashville'], ['Memphis', 'memphis'], ['Knoxville', 'knoxville'], ['Chattanooga', 'chattanooga']]

	after_create :tweet

	private

	def tweet
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "IYobBOTNVSTTIUyxWvfQpfHlA"
		  config.consumer_secret     = "kujonhkJuVuyLkkPATE9uOFY5mqOvCJV9cSQfXENpWTQZNi0fB"
		  config.oauth_token        = "3284734880-Dk0QJVNe41tSqIuVyaxSPKKftEAPJEJfGic7Mqy"
		  config.oauth_token_secret = "ywQaprR19SEkLSmECxa9bv5FLTiEjw1QALfF99HAxfcgZ"
		end
		client.update(self.feed.titleize + " " + self.incident_type.titleize + " ALERT: " + self.body)
	end
end
