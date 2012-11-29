require 'spec_helper'

describe Admin::CategoriesController do
  include AuthHelper
  before do
    @category = FactoryGirl.create(:category)
    @second_category = FactoryGirl.create(:category)
    http_login
  end

  describe 'GET #index' do
    it 'populates an array of categories' do
      get :index
      assigns(:categories).should == [@category, @second_category]
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category to @category' do
      get :show, id: @category.id
      assigns(:category).should == @category
    end

    it 'renders the show view' do
      get :show, id: @category.id
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested category to @category' do
      get :edit, id: @second_category.id
      assigns(:category).should == @second_category
    end

    it 'renders the edit view' do
      get :edit, id: @second_category.id
      response.should render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new category in the database' do
        post :create, category: FactoryGirl.attributes_for(:category)
        assigns(:category).should_not be_new_record
      end
      it 'redirects to the index page' do
        post :create, category: FactoryGirl.attributes_for(:category)
        response.should redirect_to(admin_categories_path)
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new invalid category in the database' do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        assigns(:category).should_not be_valid
      end
      it 're-renders the new page' do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'assigns the requested category to @category' do
        put :update, id: @category.id
        assigns(:category).should == @category
      end
      it 'saves the new attributes from category on the existing category' do
        put :update, id: @category.id, category: FactoryGirl.attributes_for(:category, name: "Frutos do Mar")
        @category.reload
        @category.name.should == "Frutos do Mar"
      end
      it 'redirects to the index page' do
        put :update, id: @category.id, category: FactoryGirl.attributes_for(:category)
        response.should redirect_to(admin_categories_path)
      end
    end
    context 'with invalid attributes' do
      it 'assigns the requested category to @category' do
        put :update, id: @category.id
        assigns(:category).should == @category
      end
      it 'saves the new attributes from category on the existing category' do
        put :update, id: @category.id, category: FactoryGirl.attributes_for(:invalid_category)
        @category.reload
        @category.name.should == @category.name
      end
      it 're-renders the edit page' do
        put :update, id: @category.id, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the selected category' do
      delete :destroy, id: @category.id
      Category.exists?(@category.id).should be_false
    end
    it 'redirects to the index page' do
      delete :destroy, id: @category.id
      response.should redirect_to(admin_categories_path)
    end
  end
end