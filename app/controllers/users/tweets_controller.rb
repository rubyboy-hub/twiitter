class Users::TweetsController < ApplicationController
    def index
        tweets = Tweets.all
        render json: tweets, status: :ok
      end
end
