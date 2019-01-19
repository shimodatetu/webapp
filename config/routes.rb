Rails.application.routes.draw do
  
  get 'users/index'
  get 'thread/show/:id' => 'thread#show'
  get 'sessions/index'
  get 'posts/index'
  post "posts",to: "posts#create",as: "posts"
  get '/profile',to: 'profile#show'
  patch '/profile', to: 'profile#update'
  get '/groups',to:'groups#new'
  post '/groups',to:'groups#create'
  resources :users


  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'thread_all#show'
  #root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
