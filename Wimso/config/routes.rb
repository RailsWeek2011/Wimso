Wimso::Application.routes.draw do
  resources :runs

resources :run do
  resources :comments
end

  resources :episodes

  resources :comments

  resources :tags

  devise_for :users
  get "users/:id" => "user#show_profile", :as => "show_profile"
  put "users/:id" => "user#add_friend", :as => "add_friend"
  
  get "/comments/new/" => "comments#new", :as => "comment_new"
  post "/runs/:id/rate1" => "runs#ratep", :as => "runs_rate_p"
  post "/runs/:id/rate2" => "runs#ratem", :as => "runs_rate_m"
  post "/users/:id/addmy" => "user#add_my", :as => "my_list_add"
  get "/user/:id/:sgn" => "user#edt_ur", :as => "edit_ur"
  delete "/user/del/:id" => "user#del_ur", :as => "delete_ur"
  post "/episodes/new/:id" => "episodes#new", :as => "new_eps"
  #put    "/runs/:id/up" => "runs#update", :as => "update_run"

  root :to => "global#index"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
