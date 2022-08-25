class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_venue, only: %i[edit update show]

  def index
    # @venues = Venue.all
    # @venues = policy_scope(Venue)
    if params[:query].present?
      @venues = policy_scope(Venue).search_by_title_and_location(params[:query])
    else
      @venues = policy_scope(Venue)
    end
  end

  def show
    @markers = [
      {
        lat: @venue.latitude,
        lng: @venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: {venue: @venue}),
        image_url: @venue.photo.url
      }
    ]
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    authorize @venue

    respond_to do |format|
      if @venue.save
        format.html { redirect_to venue_url(@venue), notice: "Venue was successfully created." }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to venue_url(@venue), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def venue_params
    params.require(:venue).permit(:title, :description, :location, :capacity, :category, :price, :photo)
  end

  def set_venue
    @venue = Venue.find(params[:id])
    authorize @venue
  end
end
