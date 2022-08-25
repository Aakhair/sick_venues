class ReservationsController < ApplicationController

  before_action :set_venue, only: %i[create]

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.venue = @venue
  
    if @reservation.save!
      redirect_to venue_path(@venue)
    else
      @review = Reservation.new
      render :modal, status: :unprocessable_entity
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
