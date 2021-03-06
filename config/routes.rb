Addament::Application.routes.draw do

  resources :peers


  resources :orgrequests


  resources :steps


  resources :organizations_professionals


  resources :organizations do
    collection do
      get 'code_image'
      post 'accept_user'
      post 'reject_user'
    end
  end

  resources :requesttomentors


  resources :profile_comments


  resources :goal_comments do
    collection do
      post 'add_goalcomment'
    end
  end


  resources :schools




  resources :feedback do
    collection do
      post 'send_email'
      get 'search_for_user'
      get 'privacy_policy'
      get 'change_priority'
      get 'filter_data'
      get 'show_user_profile'
    end
  end
  resources :educations do
    collection do
      get 'add_more_school'
      post 'create_education'
    end
  end


  resources :comments



  resources :my_activities


  resources :milestones


  resources :goals

  resources :posts do
    member do
      get 'comment_current_post'
      get 'del_comment'
      post 'create_comment'
      get 'follow_from_post'
    end
  end

  resources :companies


  resources :professionals
  resources :todos
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :filter_result
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
      post 'follow_profile'
      post 'follow_my_profile'
      post 'follow_as_peer'
      post 'unfollow'
      post 'unfollow_mentee'
      post 'unfollow_profile'
      post 'follow_list'
      post 'accept_user'
      post 'accept_mentor'
      post 'reject_user'
      post 'reject_mentor'
      post 'show_request'
    end
  end
  resources :profiles do
    collection do
      get 'path'
      get 'about'
      get 'code_image'
      get 'other_user_image'
      post 'about_update'
      post 'preview'
    end
  end
  resources :educations  , controller: 'users/educations'
  resources :professional_industries  , controller: 'users/professional_industries'
  #match "*path" => 'error#handle404'
  match "/my_account" => "users#show",as: :my_account
  match "/public_profile" => "users#public_profile",as: :public_profile
  match "/show_all_activity" => "users#show_all_activity",as: :show_all_activity
  match "/show_mentee_request" => "users#show_mentee_request",as: :show_mentee_request
  match "/show_mentor_request" => "users#show_mentor_request",as: :show_mentor_request
 # match "*path" => 'users#show'
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
