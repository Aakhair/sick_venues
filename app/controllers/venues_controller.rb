class VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end

  def create

  end


  private

  def venue_params
    @venue = Venue.find(params[:id])
  end
end
