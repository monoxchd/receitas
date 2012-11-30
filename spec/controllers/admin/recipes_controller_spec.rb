require 'spec_helper'

describe Admin::RecipesController do
  include AuthHelper
  before do
    @recipe = FactoryGirl.create(:recipe, category_id: '1')
    @second_recipe = FactoryGirl.create(:recipe, category_id: '1')
    http_login
  end

  describe 'GET #index' do
    it 'populates an array of recipes' do
      get :index
      assigns(:recipes).should == [@recipe, @second_recipe]
    end

    it 'renders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #new' do
    it 'renders the new view' do
      get :new
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested recipe to @recipe' do
      get :edit, id: @recipe.id
      assigns(:recipe).should == @recipe
    end

    it 'renders the edit view' do
      get :edit, id: @recipe.id
      response.should render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new recipe in the database' do
        post :create, recipe: FactoryGirl.attributes_for(:recipe, category_id: '1')
        assigns(:recipe).should_not be_new_record
      end
      it 'redirects to the index page' do
        post :create, recipe: FactoryGirl.attributes_for(:recipe, category_id: '1')
        response.should redirect_to(admin_recipes_path)
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new invalid recipe in the database' do
        post :create, recipe: FactoryGirl.attributes_for(:recipe, description: nil)
        assigns(:recipe).should_not be_valid
      end
      it 're-renders the new page' do
        post :create, recipe: FactoryGirl.attributes_for(:recipe, description: nil)
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'assigns the requested recipe to @recipe' do
        put :update, id: @recipe.id
        assigns(:recipe).should == @recipe
      end
      it 'saves the new attributes from recipe on the existing recipe' do
        put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe, name: "Torta de Abacate")
        @recipe.reload
        @recipe.name.should == "Torta de Abacate"
      end
      it 'redirects to the index page' do
        put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe)
        response.should redirect_to(admin_recipes_path)
      end
    end
    context 'with invalid attributes' do
      it 'assigns the requested recipe to @recipe' do
        put :update, id: @recipe.id
        assigns(:recipe).should == @recipe
      end
      it 'saves the new attributes from recipe on the existing recipe' do
        put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe, description: nil)
        @recipe.reload
        @recipe.description.should == @recipe.description
      end
      it 're-renders the edit page' do
        put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe, description: nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the selected recipe' do
      delete :destroy, id: @recipe.id
      Recipe.exists?(@recipe.id).should be_false
    end
    it 'redirects to the index page' do
      delete :destroy, id: @recipe.id
      response.should redirect_to(admin_recipes_path)
    end
  end
end