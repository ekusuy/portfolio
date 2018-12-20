Rails.application.routes.draw do
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  resources :users, only: %i[show index] do
    resources :contents, param: :position, only: %i[edit update]
  end
  delete '/logout', to: 'oauths#destroy'
  root 'user_sessions#login'
end
