Rails.application.routes.draw do
  resources :contents
  resources :courses
  resources :users
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  get 'courses/:id/contents', to: 'contents#index', as: 'course_contents'

  get 'courses/:id/contents/new', to: 'contents#new', as: 'course_contents_new'

  root to: 'home#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
