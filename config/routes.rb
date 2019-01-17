Rails.application.routes.draw do
  get 'profile/index'
  get 'thread/index'
  get 'users/index'
  get 'thread/index/:id' => 'thread#index'
  get 'sessions/index'
  get 'posts/index'
  post "posts",to: "posts#create",as: "posts"
  get 'groups/index'

  resources :users

  get    '/login',   to: 'sessions#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'thread_all#index'
  #root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
