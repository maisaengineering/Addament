Addament::Application.routes.draw do
  resources :companies


  resources :professionals
  
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end


 # devise_for :users

  devise_for :users ,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  devise_scope :user do
    # match "/login" => "devise/sessions#new"
    # delete "/logout" => "devise/sessions#destroy"
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
    post 'users/auth/register'=>'users/omniauth_callbacks#create'
  end
  authenticated :user do
    root :to => 'users#show'
  end
  devise_scope :user do
    root to: "devise/sessions#new"
  end
   resources :users  do
    collection do
      get 'tokenizer'
      post 'follow'
      post 'unfollow'
    end
  end
    resources :profiles do
      collection do
         get 'path'
        get 'about'
        post 'about_update'
      end
    end 
    resources :educations  , controller: 'users/educations'
    resources :professional_industries  , controller: 'users/professional_industries'
  
   match "/my_account" => "users#show",as: :my_account
   match "/public_profile" => "users#public_profile",as: :public_profile
   match "/show_all_activity" => "users#show_all_activity",as: :show_all_activity
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
  # match ':controller(/:action(/:id))(.:format)'
end
