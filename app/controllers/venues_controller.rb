class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]

  def show
    @venue = Venue.find(params[:id])
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
  end
end
