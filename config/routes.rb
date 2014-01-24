BrcBikes::Application.routes.draw do
  root "posts#index"
  resources :posts do 
    resources :photos
  end
  resources :users
end
