Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get 'home', to: 'videos#index'
  get 'register', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destory'

  get 'my_queue', to: 'queue_items#index'
  post 'my_queue', to: 'queue_items#update_queue'

  resources :videos, only: [:index, :show] do
    collection do
      post 'search', to: 'videos#search'
    end
    member do
      resource :reviews, only: [:create]
    end
  end
  resources :categories, only: [:show]
end
