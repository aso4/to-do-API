Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :lists do
      resources :items
    end
  end

  get 'users/index'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
