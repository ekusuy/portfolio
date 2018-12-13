Rails.application.routes.draw do
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  get '/login', to: 'user_sessions#login'
  root 'user_sessions#login'
end
