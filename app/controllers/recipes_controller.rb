class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.all
    @foods = Food.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, notice: 'Recipe was not created.', status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @recipe = Recipe.find(params[:id])
    @recipe.public = if @recipe.public
                       false
                     else
                       true
                     end
    @recipe.save
    redirect_to recipe_url(@recipe.id), notice: "Public status changed to #{@recipe.public}."
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

  def shopping_list
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: params[:id])
    @total_items = @recipe_foods.count
    @total_price = 0
    @recipe_foods.each do |recipe_food|
      @total_price += recipe_food.food.price * recipe_food.quantity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :prep_time, :cook_time, :steps, :public)
  end
end
