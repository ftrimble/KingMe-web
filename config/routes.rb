KingmeWeb::Application.routes.draw do
  resources :hotspots

  resources :goals

  resources :rides

  devise_for :users
  resources :groups
  root "rides#index"
  get 'upload_ride' => 'rides#upload_ride' 
end
