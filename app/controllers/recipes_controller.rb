class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to "/"
  end
  def index
    @recipes = Recipe.all
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to :action => "show", :id => @recipe
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :name,
      :explain,
      :admin_id,
      :restaurant_id,
      :cook,
      :pic)
  end
end
