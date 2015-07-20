Rails.application.routes.draw do
  root to: "pages#index"
  get "/search" => "resources#index"
  get "/about" => "pages#about"
  get "/guide" => "pages#guide"
  resources :resources, only: [:index, :show]
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :admin do
    get "/" => "pages#index"
    resources :users
    resources :tags
    resources :resources
    resources :ratings
    resources :providers
  end
end
