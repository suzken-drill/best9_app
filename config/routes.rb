Rails.application.routes.draw do
  root to: 'static_page#index'
  get '/help', to: 'static_page#help'
  get '/about', to: 'static_page#about'
  get '/rule', to: 'static_page#rule'
  get '/owner', to: 'static_page#owner'
  resources :teams, only: [:index, :show, :new, :create]
  post '/teams/:id', to: 'comments#create', as: "comment"
  resources :likes, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
