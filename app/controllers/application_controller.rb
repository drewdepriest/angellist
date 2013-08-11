class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include HTTParty
	format :json

	def index

		@response = JSON.parse HTTParty.get("https://api.angel.co/1/tags/1626/jobs").response.body

		# Get the count of all startup jobs posted
		@count = @response["total"]

	end

	def popular

		@response = JSON.parse HTTParty.get("https://api.angel.co/1/tags/1626/startups?order=asc").response.body

	end	

end
