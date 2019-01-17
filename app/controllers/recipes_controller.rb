class RecipesController < ApplicationController



  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'salt')
    @recipe.ingredients.build(name: 'pepper')
  end

  def create
    @ingredients = []
    params[:recipe][:ingredients_attributes].values.each do |obj|
      @ingredients << Ingredient.find_or_create_by(obj)
    end
    # byebug
    @recipe = Recipe.new(recipe_params(:title))
    @recipe.ingredients << @ingredients
    @recipe.save
    # byebug
    redirect_to @recipe
  end

  private

  def recipe_params(*args)
    params.require(:recipe).permit(args)
  end
end
