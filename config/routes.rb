Receitas::Application.routes.draw do

  devise_for :users

  root :to => 'categories#index'
  match 'busca/(:query)' => 'recipes#search', as: :recipe_search
  get 'categorias/:id/mais-visualizadas' => 'categories#viewed', as: :category_most_viewed

  resources :categories, only: [:index, :show], path: 'categorias' do
    resources :recipes, only: [:show], path: 'receitas' do
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
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
