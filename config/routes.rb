Rails.application.routes.draw do
  get 'home/index'

  get '/_ah/vm_health', to: "home#health_check"


  resources :cats do
    resources :votes, only: [:new, :create]
  end

  root to: "home#index"
end
