Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :abouts, only:[:index]
  resources :products do
    resources :orders, only:[:index, :create]
    resources :comments, only:[:new, :create]
    collection do
      get 'search'
    end
  end
end