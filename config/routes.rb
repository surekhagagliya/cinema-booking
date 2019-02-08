Rails.application.routes.draw do
  devise_for :managers
  root 'welcomes#index'
  resources :welcomes, only: [:index]

  resources :managers do
    resources :profiles
    resources :screens do
      resources :movie_shows do
        resources :seat_bookings
      end
    end
    resources :movies do
      resources :actors
      resources :votes
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
