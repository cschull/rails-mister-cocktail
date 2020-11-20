require 'json'
require 'open-uri'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    unless @cocktail.photo.attached?
      @cocktail.img_url = custom_image(@cocktail)
    end
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def custom_image(cocktail)
    url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail.name}"
    cocktail_api = open(url).read
    cocktail_parsed = JSON.parse(cocktail_api)
    img_url = cocktail_parsed['drinks'][0]['strDrinkThumb']
    return img_url
  end
end
