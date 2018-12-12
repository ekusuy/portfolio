Rails.application.routes.draw do
  resources :users, only: %i[show]
  root to: 'users#index'
end
