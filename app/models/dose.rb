class Dose < ApplicationRecord
  # must have a cocktail and ingredient if it belongs to teh class
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient_id
end
