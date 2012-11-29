class Admin::CategoriesController < Admin::BaseController

  respond_to :html, :xml, :json

  def index
    @categories = Category.all

    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])

    respond_with @category
  end

  def new
    @category = Category.new

    respond_with @category
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    flash[:notice] = 'Category was sucessfully created.' if @category.save
    respond_with @category, :location => admin_categories_path
  end

  def update
    @category = Category.find(params[:id])

    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:category])
    respond_with @category, :location => admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path
  end
end
