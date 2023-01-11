class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_api_v1_user!
  before_action :authorize_request, except: %i[index create]
  before_action :find_user, except: %i[create index]

  ALLOWED_DATA = %(name email password role).freeze

  # GET /users
  def index
    users = User.all
    render json: users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) && allow != 'role' }
    return render json: { error: 'Empty body. Could not create user.' }, status: :unprocessable_entity if data.empty?

    user = User.new(data)
    if user.save
      render json: user, status: :ok
    else
      render json: { error: 'Could not create user.' }, status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    if current_user.is? :admin
      data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
      return render json: { error: 'Empty body. Could not update user.' }, status: :unprocessable_entity if data.empty?

      if @user.update(data)
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Unauthorized.' }, status: :unauthorized
    end
  end

  # DELETE /users/:id
  def destroy
    if current_user.is? :admin
      @user.destroy
      render json: @user, status: :ok
    else
      render json: { error: 'Unauthorized.' }, status: :unauthorized
    end
  end

  private

  def find_user
    @user = User.find_by_id!(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end










  # GET /users or /users.json
  # def index
  #   render json: current_api_v1_user, status: :ok
  # end








  # # GET /users/1 or /users/1.json
  # def show; end

  # # GET /users/new
  # def new
  #   @user = User.new
  # end

  # # GET /users/1/edit
  # def edit; end

  # # POST /users or /users.json
  # def create
  #   @user = User.new(user_params)

  #   respond_to do |format|
  #     if @user.save
  #       format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
  #       format.json { render :show, status: :created, location: @user }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /users/1 or /users/1.json
  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /users/1 or /users/1.json
  # def destroy
  #   @user.destroy

  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # # Only allow a list of trusted parameters through.
  # def user_params
  #   params.require(:user).permit(:name)
  # end
end
