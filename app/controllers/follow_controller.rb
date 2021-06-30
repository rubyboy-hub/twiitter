class FollowController < ApplicationController
    before_action :authenticate_user!
    
    def create
      
      # result = Follow.where(follow_details,user_id: current_user.id).exists?
      # render json: result, status: :ok
      if already_follow
           render json: "Already folllowing", status: :created

        
        else
          followers = current_user.follows.new(follow_details)

          if followers.save
            render json: "Following #{follow_details}", status: :created
          else
            render json: {
              errors: followers.errors.full_messages
            }, status: :unprocessable_entity
          end
        end
    end
    def show
    end
    def follow_tweets
        following_users = current_user.follows.pluck(:following)
        if following_users.present?
            render json: Tweet.where('user_id IN (?)',following_users), status: :ok
        else
          render json: Tweet.where('user_id IN (?)',following_users), status: :ok
        end
    end
    private
    def follow_details
        params.permit(:following)
    end
    # private
    def already_follow
      result = Follow.where(follow_details,user_id: current_user.id).exists?
    end
end
