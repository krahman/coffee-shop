Rails.application.routes.draw do
  resources :sizes
  resources :types
  resources :menus
  resources :orders
  
  root 'pages#home'

  get 'orders/new'
  get 'orders/create'
  get 'orders/update'
  get 'orders/edit'
  get 'orders/destroy'
  get 'orders/index'
  get 'orders/show'
  get 'menus/new'
  post 'menus/create'
  put 'menus/update'
  get 'menus/edit'
  delete 'menus/destroy'
  get 'menus/index'
  get 'menus/show'
  get 'sizes/new'
  post 'sizes/create'
  put 'sizes/update'
  get 'sizes/edit'
  delete 'sizes/destroy'
  get 'sizes/index'
  get 'sizes/show'
  get 'types/new'
  post 'types/create'
  put 'types/update'
  get 'types/edit'
  delete 'types/destroy'
  get 'types/index'
  get 'types/show'
end
