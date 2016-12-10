Rails.application.routes.draw do
  get 'items/edit'

  get 'items/index'

  get 'items/new'

  get 'items/show'

  get 'lists/index'

  get 'lists/create'

  get 'lists/show'

  get 'lists/new'

  get 'lists/edit'

  get 'lists/update'

  get 'lists/destroy'

  get 'users/index'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
