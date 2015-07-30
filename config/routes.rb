Rails.application.routes.draw do
  root to: "pages#index"
  get "/about" => "pages#about"
  get "/guide" => "pages#guide"
  get "/search" => "search#index"
  resources :providers, only: [:show]
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :admin do
    get "/" => "pages#index"
    get "/guide" => "pages#guide"
    resources :users, except: [:show]
    resources :categories, except: [:show]
    resources :services, except: [:show]
    resources :ratings, except: [:show]
    resources :providers, except: [:show]
  end
end
