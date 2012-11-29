class Admin::RecipesController < Admin::BaseController

    respond_to :html, :xml, :json

  def index
    @recipes = Recipe.all

    respond_with @categories
  end

  def show
    @recipe = Recipe.find(params[:id])

    respond_with @recipe
  end

  def new
    @recipe = Recipe.new

    respond_with @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    flash[:notice] = 'Category was sucessfully created.' if @recipe.save
    respond_with @recipe, :location => admin_recipes_path
  end

  def update
    @recipe = Recipe.find(params[:id])

    flash[:notice] = 'Category was successfully updated.' if @recipe.update_attributes(params[:recipe])
    respond_with @recipe, :location => admin_recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_with @recipe, :location => admin_recipes_path
  end
end
