BrcBikes::Application.routes.draw do
  root "posts#index"
  resources :posts do 
    resources :photos
  end
  resources :users
  get "/signin", to: "sessions#new"
  post "signin", to: "sessions#create"
end
