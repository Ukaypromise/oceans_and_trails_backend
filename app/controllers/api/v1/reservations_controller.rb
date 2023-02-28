class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  # GET /reservations or /reservations.json
  def index
    render json: current_user.reservations.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show; end

  # GET /reservations/1/edit
  def edit; end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      # render :create, status: :created
      render json: @reservation, status: :created
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    render json: { message: 'Reservation has been successfully deleted' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:startDate, :endDate, :tour_id).with_defaults(user_id: current_user.id)
  end
end
