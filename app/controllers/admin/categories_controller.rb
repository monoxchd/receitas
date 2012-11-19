class Admin::CategoriesController < ApplicationController
  respond_to :html, :xml, :json
  # GET /admin/categories
  # GET /admin/categories.json
  def index
    @categories = Category.all

    respond_with @categories
  end

  # GET /admin/categories/1
  # GET /admin/categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_with @category
  end

  # GET /admin/categories/new
  # GET /admin/categories/new.json
  def new
    @category = Category.new

    respond_with @category
  end

  # GET /admin/categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /admin/categories
  # POST /admin/categories.json
  def create
    @category = Category.new(params[:category])

    flash[:notice] = 'Category was sucessfully created.' if @category.save
    respond_with @category, :location => admin_categories_path
  end

  # PUT /admin/categories/1
  # PUT /admin/categories/1.json
  def update
    @category = Category.find(params[:id])

    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params[:category])
    respond_with @category, :location => admin_categories_path
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_with @category, :location => admin_categories_path
  end
end
