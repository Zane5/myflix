Myflix::Application.routes.draw do
  root to: "pages#front"
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: 'videos#index'
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'


  get 'my_queue', to: 'queue_items#index'
  post 'my_queue', to: 'queue_items#update_queue'

  resources :videos, only: [:index, :show] do
    collection do
      get 'search', to: 'videos#search'
    end
    resource :reviews, only: [:create]
  end
  
  resources :categories, only: [:show]
  resources :queue_items, only:[:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'

  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
