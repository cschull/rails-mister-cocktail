# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = open(url).read
ingredients_parsed = JSON.parse(ingredients)

ingredients_parsed['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

cocktails = ['mojito', 'margarita', 'old fashioned', 'cosmopolitan', 'moscow mule']
cocktails.each do |cocktail|
  url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail}"
  cocktail_api = open(url).read
  cocktail_parsed = JSON.parse(cocktail_api)
  img_url = cocktail_parsed['drinks'][0]['strDrinkThumb']
  Cocktail.create(name: cocktail, img_url: img_url)
end

