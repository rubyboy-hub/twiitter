class TweetsController < ApplicationController
before_action :authenticate_user!
# skip_before_action :authenticate_user!, :only => :show
def show
       tweet = Tweet.where(user_id: current_user.id)
       render json: { tweets: tweet}
    end
def create
    user = User.where(user_id: current_user.id)
    tweet = current_user.tweets.new(tweet_details)
      if tweet.save
        render json: "tweet saved", status: :created
      else
        render json: {
          errors: tweet.errors.full_messages
        }, status: :unprocessable_entity
      end
end
def followers_tweets
        render json: { message: current_user.id}
end
def tweet_details
    params.permit(:thought)
end
end