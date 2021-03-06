Trackernew::Application.routes.draw do



  devise_for :views
  devise_for :users
  get "welcome/index"
  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  resources :users

  get "users/new"
  get "users/edit"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :requests do 
    resources :assignments
    resources :comments
  end
  # You can have the root of your site routed with "root"
    root to: 'requests#index'
    resources :user_sessions
    resources :users
  get 'User' => 'users#show'
  get 'Users' => 'users#index'
  get 'New_Request' => 'requests#new'
   get 'assignments' => 'assignments#index'
   get 'requests' => 'requests#index' 
   get 'users/sign_in', to: 'devise/sessions#new'
  post 'logout' => 'devise/sessions#destroy', :as => :logout
  get 'users/sign_up' => 'devise/users#new'
end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):


  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

