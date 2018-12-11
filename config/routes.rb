Rails.application.routes.draw do
  resources :users, only: %i[show] do
    resources :contents, param: :position, only: [:edit]
  end
  root to: 'contents#search'
end
