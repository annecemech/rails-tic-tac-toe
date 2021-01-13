Rails.application.routes.draw do
  devise_for :users
  root to: 'games#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:show] do
    resources :cells, only: [ :update ]
  end

  get 'game/replay', to: 'games#replay', as: :replay

end
