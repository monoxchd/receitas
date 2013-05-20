Receitas::Application.routes.draw do

  devise_for :users

  root :to => 'categories#index'
  match 'busca/(:query)' => 'recipes#search', as: :recipe_search
  get 'categorias/:id/mais-visualizadas' => 'categories#viewed', as: :category_most_viewed

  resources :categories, only: [:index, :show], path: 'categorias' do
    resources :recipes, only: [:show], path: 'receitas' do
      resources :comments, only: [:create, :delete]
      member do
        post :rate
      end
    end
  end

  resources :recipes, only: [:index], path: 'receitas' do
    member do
      post :rate
    end
  end

  namespace :admin do
    resources :categories
    resources :recipes, except: [:show]
  end
  
  
end
