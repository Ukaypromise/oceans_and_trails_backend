class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users
  def index
    render json: current_user, status: :ok
  end

  private

  def find_user
    @user = User.find_by_id!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  # # GET /users/1 or /users/1.json
  def show; end
end
