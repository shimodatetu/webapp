Rails.application.routes.draw do
  get 'account_activations/check'
  get 'password_resets/new'
  get 'password_resets/new_check'
  get 'password_resets/edit'
  get 'search/show'
  get 'category/new'
  get 'category/new2'
  get 'category/smallcategory/:id/:page' => 'category#smallcategory'
  get 'category/smallcategory/:id' => 'category#smallcategory'
  match '/small_new' => 'category#small_new', via: [ :post ]
  match '/big_new' => 'category#big_new', via: [ :post ]
  match '/all_new' => 'category#all_new', via: [ :post ]

  get 'category/show'
  post 'tasks/en',to:'tasks#lang_change_en'
  post 'tasks/jp',to:'tasks#lang_change_jp'
  post 'search/header',to:'tasks#search'
  post 'search/inside',to:'tasks#search_inside'
  post 'logout/inner',to:'tasks#logout_inner'
  get 'signup',to:'users#index'
  get 'thread/show/:id' => 'thread#show'
  get 'thread/show/:id/:page' => 'thread#show'
  get 'thread_all/show/:id' => 'thread_all#show'
  get 'sessions/index'
  get 'posts/index'
  post "posts",to: "posts#create",as: "posts"
  get '/profile',to: 'profile#show'
  get '/profile/:id' => 'profile#show'
  patch '/profile', to: 'profile#update'
  get '/groups',to:'groups#new'
  post 'profile/send_img'
  get 'users/index'
  resources :users
  resources :profile
  resources :profile do
    member do
      get "show_image"
    end
  end
  resources :thread do
    member do
      get "show_post_image"
    end
  end
  resources :pv_page do
    member do
      get "show_image"
    end
  end
  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'pv_page#show'

  get '/:id' => 'pv_page#show'
  #root 'users#index'
  resources :password_resets,     only: [:new, :create, :edit, :update, :new_check]
  resources :account_activations, only: [:edit]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
