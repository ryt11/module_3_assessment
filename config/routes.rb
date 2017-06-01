Rails.application.routes.draw do
  root 'search#new'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :update, :destroy]
    end
  end
  get '/search', to: 'search#index', as: 'best_buy_index'
  post '/search', to: 'search#create', as: 'best_buy_search'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
