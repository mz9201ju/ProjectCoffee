Rails.application.routes.draw do
  resources :recipes
  
  root "recipes#index"
  
  get  'auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
end