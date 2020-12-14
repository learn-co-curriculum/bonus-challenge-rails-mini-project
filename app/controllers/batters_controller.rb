class BattersController < ApplicationController
  def index
    @batters = Batter.all
  end

  def show
    @batter = Batter.find(params[:id])
  end

  def new
    @batter = Batter.new
  end

  def edit
    @batter = Batter.find(params[:id])
  end

  def create
    @batter = Batter.create(batter_params(:name, :tier))
    redirect_to batter_path(@batter)
  end

  def update
    @batter = Batter.find(params[:id])
    @batter.update(batter_params(:name, :tier))
    redirect_to batter_path(@batter)
  end


  private

  def batter_params(*args)
    params.require(:batter).permit(*args)
  end

end
