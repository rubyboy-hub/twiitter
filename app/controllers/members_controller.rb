class MembersController < ApplicationController
    before_action :authenticate_user!
    # skip_before_action :authenticate_user!, :only => :show

  
    def show
      users = User.all
      render json: users, status: :ok
    end
    def detailed_view
      find_user
      if @user.present?
        render json: @user, status: :ok
      else
        render json: {
          errors: 'user not found'
        }, status: :not_found
      end
    end
    def find_user
      @user = User.where(id: params[:id].to_i)
    end
  end