Rails.application.routes.draw do
  resources :enrollments

  get 'sessions/new'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  delete '/drop', to: 'enrollments#delete_enrollment'
  get '/search', to: 'static_pages#search'

  get '/index', to: 'static_pages#index'

  resources :users
  resources :subjects
  resources :instructors
  resources :courses
  root 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
