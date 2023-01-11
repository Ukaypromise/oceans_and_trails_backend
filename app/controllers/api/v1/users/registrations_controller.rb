class Api::V1::Users::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  def create
    user = User.new(sign_up_params)

    if user.save
      render json: { user: user, message: 'sign up success', is_success: true }, status: :ok
    else
      render json: { message: 'Sign up failed', is_success: false }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # respond_to :json

  # private

  # def respond_with(resource, _opts = {})
  #   if resource.persisted?
  #     render json: {
  #       status: { code: 200, message: 'Signed up sucessfully.' },
  #       data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  #     }
  #   else
  #     render json: {
  #       status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
  #     }, status: :unprocessable_entity
  #   end
  # end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # respond_to :json

  # private

  # def respond_with(resource, _opts = {})
  # if resource.persisted?
  # render json: {
  # status: { code: 200, message: 'Signed up sucessfully.' },
  # data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  # }
  # else
  # render json: {
  # status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
  # }, status: :unprocessable_entity
  #  end
  # end

  # GET /resource/sign_up

  # POST /resource

  # GET /resource/edit

  # PUT /resource

  # DELETE /resource

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.

  # The path used after sign up for inactive accounts.
end
