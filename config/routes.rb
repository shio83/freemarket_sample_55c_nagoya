Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'users/profile'
  root 'tops#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
