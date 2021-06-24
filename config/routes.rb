Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, except: [:edit, :update, :show, :destroy]
  end

  resources :about, only: [:index]

  resources :categories, only: [:index]

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  # the priority is based upon order of creation: first created -> highest priority.
  # see how all your routes lay out with "rake routes".

  # you can have the root of your site routed with "root"
  # root 'welcome#index'

  # example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # example resource route (maps http verbs to controller actions automatically):
  #   resources :products

  # example resource route with options:
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

  # example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # example resource route within a namespace:
  #   namespace :admin do
  #     # directs /admin/products/* to admin::productscontroller
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
