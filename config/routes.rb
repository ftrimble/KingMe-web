KingmeWeb::Application.routes.draw do
  resources :hotspots
  resources :goals
  resources :rides
  put "complete_goal" => 'goals#complete_goal'
  get "stream" => 'rides#stream'
  delete "goals/delete" => 'goals#destroy'

  devise_for :users
  resources :groups
  root "rides#index"
  get 'upload_ride' => 'rides#upload_ride' 
  get 'delete_goal' => 'goals#destroy'

end
