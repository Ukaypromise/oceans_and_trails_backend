class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged.' }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: 'Logged out.' }, status: :ok
    # current_user ? log_out_success : log_out_failure
  end

  # def log_out_success
  #   render json: { message: 'Logged out.' }, status: :ok
  # end

  # def log_out_failure
  #   render json: { message: 'Logged out failure.'}, status: :unauthorized
  # end

  # private

  # def respond_with(resource, _opts = {})
  #   render json: {
  #   status: { code: 200, message: 'Logged in sucessfully.' },
  #   data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  #   }, status: :ok
  #   end

  #   def respond_to_on_destroy
  #   if current_user
  #   render json: {
  #   status: 200,
  #   message: 'logged out successfully'
  #   }, status: :ok
  #   else
  #   render json: {
  #   status: 401,
  #   message: "Couldn't find an active session."
  #   }, status: :unauthorized
  #   end
  #   end

  # GET /resource/sign_in

  # POST /resource/sign_in

  # DELETE /resource/sign_out

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
