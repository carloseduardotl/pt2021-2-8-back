Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :contacts
  resources :tags
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*', to: 'application#not_found'
end
