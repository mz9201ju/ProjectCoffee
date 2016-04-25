Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :recipes
  
  root "recipes#index"
  get 'order' => "recipes#orders"
  get "/recipes/doIt" => "recipes#doIt" 
  get 'auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end