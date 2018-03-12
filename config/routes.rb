Rails.application.routes.draw do

  resources :games, only: [:index, :show, :result, :create] do
    resources :guesses, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
