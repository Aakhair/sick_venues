class ReservationsController < ApplicationController
  before_action :set_venue, only: %i[create]

  def my_reservations
    @reservations = current_user.reservations
    authorize @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.venue = @venue
    if @reservation.save
      redirect_to venue_path(@venue), notice: "Booking was successfully made."
    else
      @reservation = Reservation.new
      redirect_to venue_path(@venue), status: :unprocessable_entity, alert: "This date has been already booked."
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end


  def set_venue
    @venue = Venue.find(params[:venue_id])
    authorize @venue
  end

end
