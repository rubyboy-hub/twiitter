class Users::RegistrationsController < Devise::RegistrationsController
    # before_action :authenticate_user!

    respond_to :json
  
    private

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
  
    def respond_with(resource, _opts = {})
      if resource.persisted?
        register_success
      else
        register_failed
      end
    end
  
    def register_success
      render json: { message: 'Signed up sucessfully.' }
    end
  
    def register_failed
      render json: { message: "Something went wrong." }
    end

    def user_details
      params.permit(:email,:password,:firstName, :lastName)
    end
  end