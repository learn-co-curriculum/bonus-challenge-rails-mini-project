class PlateAppearancesController < ApplicationController
  def index
    @plate_appearances = PlateAppearance.all
  end

  def main
  end

  def show
    @plate_appearance = PlateAppearance.find(params[:id])
    @outcome = @plate_appearance.outcome
  end

  def new
    @plate_appearance = PlateAppearance.new
  end

  def edit
    @plate_appearance = PlateAppearance.find(params[:id])
  end

  def create
    @plate_appearance = PlateAppearance.create(plate_appearance_params(:batter_id, :pitcher_id))
    redirect_to plate_appearance_path(@plate_appearance)
  end

  def update
    @plate_appearance = PlateAppearance.find(params[:id])
    @plate_appearance.update(plate_appearance_params(:batter_id, :pitcher_id))
    redirect_to plate_appearance_path(@plate_appearance)
  end


  private

  def plate_appearance_params(*args)
    params.require(:plate_appearance).permit(*args)
  end

end