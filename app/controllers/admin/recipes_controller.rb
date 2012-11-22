class Admin::RecipesController < Admin::BaseController
	  http_basic_authenticate_with :name => "admin", :password => "admin"
    respond_to :html, :xml, :json
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @recipes = Recipe.all

    respond_with @categories
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_with @recipe
  end

  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @recipe = Recipe.new

    respond_with @recipe
  end

  # GET /admin/categories/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @recipe = Recipe.new(params[:recipe])

    flash[:notice] = 'Category was sucessfully created.' if @recipe.save
    respond_with @recipe, :location => admin_recipes_path
  end

  # PUT /admin/categories/1
  # PUT /admin/categories/1.json
  def update
    @recipe = Recipe.find(params[:id])

    flash[:notice] = 'Category was successfully updated.' if @recipe.update_attributes(params[:recipe])
    respond_with @recipe, :location => admin_recipes_path
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_with @recipe, :location => admin_recipes_path
  end
end
