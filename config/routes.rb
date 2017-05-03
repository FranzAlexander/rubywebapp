Rails.application.routes.draw do
  resources :contents
  resources :courses
  get 'dashboard', to: 'base#dashboard'
  get 'admin', to: 'courses#adminhome'
  get 'admin_manage', to: 'users#admin_users_info'
  get 'admin_user_edit', to: 'users#users_edit'

  resources :users
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#home'
end
