class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    # find each public recipe id and get the recipe_foods
    @recipe_foods = RecipeFood.all
    @total_items = @recipe_foods.count
    @total_price = 0
  end
end
