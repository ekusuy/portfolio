Rails.application.routes.draw do
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  resources :users, only: %i[show] do
    resources :contents, param: :position, only: %i[edit update]
  end
  root 'user_sessions#login'
end
