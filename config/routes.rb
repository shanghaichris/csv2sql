Csv2sql::Application.routes.draw do
  
  resources :questions do
    resources :options
  end

  get "charts/index"

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

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'files#index'
  
  match '/upload' => 'files#upload',as: :upload
  match '/result' => 'files#result',as: :result
  match '/reset(/:o_id)' => 'files#reset',as: :reset
  match '/reset_files' => 'files#reset_files',as: :reset_files
  match '/charts(/questions/:question_id(/:chart_type))' => 'charts#index',as: :chart
  match '/charts/life(/questions/:question_id(/:chart_type))' => 'charts#life',as: :chart_life
  match '/charts/work(/questions/:question_id(/:chart_type))' => 'charts#work',as: :chart_work
  match '/charts/venture(/questions/:question_id(/:chart_type))' => 'charts#venture',as: :chart_venture
  match '/check_ids' => 'files#check_ids', as: :check_id
  
  match '/get_options' => 'charts#get_options'
  match '/add_series' => 'charts#add_series'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
