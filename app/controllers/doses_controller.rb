class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(cocktail_params)
    @dose.cocktail = @dose
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:review).permit(:cocktail_id)
  end

  def dose_params
    params.require(:review).permit(:description, :ingredient)
  end

end
