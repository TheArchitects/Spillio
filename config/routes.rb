Spillio::Application.routes.draw do
  get 'search/students' => 'students#search', :as => :student_search
  resources :students # TODO: Chop off some of the routes
  match 'student/cid/:id' => 'students#show_by_cid', :as => :student_show_by_cid, via: [:get]
  match 'group_join/create' => 'group_join#create'
  match 'group_join/accept/:id' => 'group_join#accept'

  # For CAS Login
  match '/fake_login' => 'login#fake_login'
  match '/login' => 'login#login', :as => :login, via: [:get]
  match '/fake_logout' => 'login#fake_logout'
  match '/logout' => 'login#logout', :as => :logout, via: [:get]
  match '/account' => 'login#index', :as => :user_account, via: [:get]

  # For Home
  root :to => 'home#index'

  # For DashBoard Controller
  match 'group/:id' => 'group_dash_board#show', :as => :group_db_show, via: [:get]
  put 'submission/:id' => 'group_dash_board#submit_assignment' , :as => :submission
  post 'assignment/:assignment_id/posts/create' => 'group_dash_board#create_post'



  # Admin Controller
  match '/admin/promote_user_to_reader/:id' => 'admins#promote_user_to_reader', :as => :promote_to_reader
  match '/admin/update' => 'admins#update', :as => :update_settings
  match '/admin/create_task' => 'admins#post_new_assignment', via: [:post]
  match '/admin' => 'admins#show', :as => :admin, via: [:get]

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
