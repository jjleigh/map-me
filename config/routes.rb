Rails.application.routes.draw do
  root to: "welcome#index"
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match "log_out" => "sessions#destroy", :as => "log_out", via: [:get, :post]
  # get 'auth/failure' => redirect('/')
end
