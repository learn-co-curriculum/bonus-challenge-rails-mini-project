class PitchersController < ApplicationController
  def index
    @pitchers = Pitcher.all
  end

  def show
    @pitcher = Pitcher.find(params[:id])
  end

  def new
    @pitcher = Pitcher.new
  end

  def edit
    @pitcher = Pitcher.find(params[:id])
  end

  def create
    @pitcher = Pitcher.create(pitcher_params(:name, :tier))
    redirect_to pitcher_path(@pitcher)
  end

  def update
    @pitcher = Pitcher.find(params[:id])
    @pitcher.update(pitcher_params(:name, :tier))
    redirect_to pitcher_path(@pitcher)
  end


  private

  def pitcher_params(*args)
    params.require(:pitcher).permit(*args)
  end

end
