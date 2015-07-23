Myflix::Application.routes.draw do
  root to: "pages#front"
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: 'videos#index'
  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destory'


  get 'my_queue', to: 'queue_items#index'
  post 'my_queue', to: 'queue_items#update_queue'

  resources :videos, only: [:index, :show] do
    collection do
      get 'search', to: 'videos#search'
    end
    member do
      resource :reviews, only: [:create]
    end
  end
  
  resources :categories, only: [:show]

  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
