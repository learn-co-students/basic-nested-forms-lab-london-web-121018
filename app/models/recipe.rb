class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredient)
    byebug
  self.ingredients << Ingredient.find_or_create_by(name: ingredient.name,quantity:ingredient.quantity)
  self.ingredients.update(ingredient)
end
end
