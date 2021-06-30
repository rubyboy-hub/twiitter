class Users::SessionsController < Devise::SessionsController
    before_action :authenticate_user!

    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      # user = User.find_by_email(resource.email)

      # if user && user.verify_password?
      #     render json: { message:user}, status: :ok
      #   else
      #     render json: { message: 'Not authorized' }, status: :unauthorized
      #   end
      user = User.where(email: resource.email).first
        if user&.valid_password?(params[:password])
            render json:{ message:"you are signed in"},status: :ok 
        else
           render json: { message:"Unauthorized"}, status: :unauthorized
        end

    end

    # def create
    #   user = User.new(user_details)
    #   if user.save
    #     render json: user, status: :created
    #   else
    #     render json: {
    #       errors: user.errors.full_messages
    #     }, status: :unprocessable_entity
    #   end
    # end


    # def create
    #   user = User.new(user_details)
    #   if user.save
    #     render json: user, status: :created
    #   else
    #     render json: {
    #       errors: user.errors.full_messages
    #     }, status: :unprocessable_entity
    #   end
    # end
  
    def respond_to_on_destroy
      log_out_success && return if current_user
  
      log_out_failure
    end
  
    def log_out_success
      render json: { message: "You are logged out." }, status: :ok
    end
  
    def log_out_failure
      render json: { message: "Hmm nothing happened."}, status: :unauthorized
    end

    def user_details
      params.permit(:email,:password,:firstName, :lastName)
    end
  end
