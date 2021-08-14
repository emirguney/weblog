Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
    root :to => 'index#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
