Rails.application.routes.draw do
  devise_for :managers
  root 'welcomes#index'
  resources :welcomes, only: [:index]

  resources :managers do
    resources :profiles
    resources :screens
    resources :movies do
      resources :actors
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
