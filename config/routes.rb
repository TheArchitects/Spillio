Spillio::Application.routes.draw do

  # Project Controller
  match '/projects/match'                       => 'projects#get_matches',          :as => :match
  post '/project/update_priorities/:group_id'   => 'projects#update_priorities',    :as => :update_priorities_for_group

  resources :projects

  get   'search/students'                       => 'students#search',               :as => :student_search
  resources :students
  match 'group_join/create'                     => 'group_join#create',             :as => :create_group_join
  match 'group_join/accept/:id'                 => 'group_join#accept',             :as => :accept_group_join


  match 'reader/groups'                         => 'reader#my_groups',              :as => :my_groups

  # For CAS Login
  match '/fake_login'                           => 'login#fake_login'
  match '/login'                                => 'login#login',                   :as => :login, via: [:get]
  match '/fake_logout'                          => 'login#fake_logout'
  match '/logout'                               => 'login#logout',                  :as => :logout, via: [:get]
  match '/account'                              => 'login#index',                   :as => :user_account, via: [:get]

  # For Home
  root :to                                      => 'home#index'

  resources :groups
  resources :tasks

  put 'submission/:id'                          => 'groups#submit_assignment' ,     :as => :submission
  post 'assignment/:assignment_id/posts/create' => 'groups#create_post'
  match 'assignment/:assignment_id/save_grade'  => 'groups#save_grade',             :as => :save_grade, via: [:post, :put]

  # Admin Controller
  match '/admin/promote_user_to_reader/:id'     => 'admins#promote_user_to_reader', :as => :promote_to_reader
  match '/admin/promote_user_to_admin/:id'      => 'admins#promote_user_to_admin',  :as => :promote_to_admin
  match '/admin'                                => 'admins#show',                   :as => :admin, via: [:get]
  match '/admin/submissions/:task_id'           => 'admins#export_submissions',     :as => :task_submitions, via: [:get]
  match '/admin/create_task'                    => 'admins#post_new_assignment', via: [:post]
  match '/admin/project_prefrences'             => 'admins#export_project_prefrences', via: [:get]

  match '/admin/update'                         => 'admins#update',                 :as => :update_settings
  match '/admin/update_users'                   => 'admins#update_users',           :as => :update_user_settings

end
