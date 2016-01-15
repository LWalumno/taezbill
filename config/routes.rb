Rails.application.routes.draw do
  get "/auth/:provider/callback" => "sessions#create"
  get "/sign_out" => "sessions#destroy"
  resources :bills
  resources :teachers, only: [:edit, :update]
  root to: "bills#new"
end
