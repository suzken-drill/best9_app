Rails.application.routes.draw do
  root to: 'static_page#index'
  get '/help', to: 'static_page#help'
  get '/about', to: 'static_page#about'
  get '/rule', to: 'static_page#rule'
  get '/owner', to: 'static_page#owner'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
