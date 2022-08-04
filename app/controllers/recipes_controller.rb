class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, notice: 'Recipe was not created.', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_url[:id]
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :prep_time, :cook_time, :steps, :public)
  end
end
