Rails.application.routes.draw do
  resources :reports
  resources :replies
  resources :likes
  resources :comments
  resources :contacts
  resources :tags
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*', to: 'application#not_found'

  # Rotas auxiliares

  get '/posts/:id/tags', to: 'posts#tags'
  get '/posts/:id/likes', to: 'posts#likes'
  get '/posts/:id/comments', to: 'posts#comments'

  get '/tags/:id/posts', to: 'tags#posts'

  get '/comments/:id/reports', to: 'comments#reports'
  get '/comments/:id/replies', to: 'comments#replies'

  # Rotas de recuperação de conta

  post "login/forgot_password", to: "users#forgot"
  post "login/reset_password", to: "users#reset"

end
