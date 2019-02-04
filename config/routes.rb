Rails.application.routes.draw do

  get 'category/new'
  match '/small_new' => 'category#small_new', via: [ :post ]
  match '/big_new' => 'category#big_new', via: [ :post ]
  
  get 'category/show'
  post 'tasks/en',to:'tasks#lang_change_en'
  post 'tasks/jp',to:'tasks#lang_change_jp'
  get 'signup',to:'users#index'
  get 'thread/show/:id' => 'thread#show'
  get 'thread_all/show/:id' => 'thread_all#show'
  get 'sessions/index'
  get 'posts/index'
  post "posts",to: "posts#create",as: "posts"
  get '/profile',to: 'profile#show'
  patch '/profile', to: 'profile#update'
  get '/groups',to:'groups#new'
  resources :users


  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'pv_page#show'
  #root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
