class Api::V1::ReservationsController < ApplicationController
	def create
    reservation = Reservation.create(reservation_params)
    if reservation.valid?
      render json: reservation
    else
      render json: { errors: reservation.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :work_shift_id, :arrival_at, :guest_count, :guest_id, :seating_table_id)
  end
end
