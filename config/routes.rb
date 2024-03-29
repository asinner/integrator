Integrator::Application.routes.draw do
  
  root 'accounts#new'
  
  resources :user_sessions
  
  resources :accounts do
    resources :users, :events
  end
  
  get 'locations/search' => 'locations#search'
  
  resources :events do 
    member do
      get 'overview'
    end
    resources :floorplans, :timelines, :uploads, :vendors, :contacts, :locations, :notes
  end
  
  resources :floorplans do
    resources :tables
  end
  
  resources :timelines do
    resources :timeline_categories
  end
  
  resources :timeline_categories do
    resources :timeline_items
  end
  
  resources :vendors do
    resources :vendor_logs
  end
  
  get 'sign-in' => 'users#sign_in', as: 'sign_in'
  delete 'sign-out' => 'user_sessions#destroy', as: 'sign_out'
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
end
