class TweetsController < ApplicationController
	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		#params
		if @tweet.save
			flash.now[:success] = "Tweet succesfully created"
			#do something
		else
			flash.now[:danger] = "Tweet cannot be saved.  Please fix errors below."
			#do something else
		end

		render 'new'
	end

	def newsfeed
		@tweets = Tweet.all
	end

	private

	def tweet_params
		params.require(:tweet).permit(:message)
	end


end
