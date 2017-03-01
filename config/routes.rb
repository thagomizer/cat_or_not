Rails.application.routes.draw do
  get 'home/index'

  resources :cats do
    resources :votes, only: [:new, :create]
  end

  root to: "home#index"
end
