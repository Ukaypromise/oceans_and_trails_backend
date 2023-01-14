class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged.', user: resource }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: 'Logged out.' }, status: :ok
    # current_user ? log_out_success : log_out_failure
  end
end
