Rails.application.routes.draw do
  resources :plags
  devise_for :users
  get 'results/compare'

	resources :docs , only: [:index ,:new , :create , :destroy, :history]
  get 'docs/index'
  get 'docs/new'
  get 'docs/create'
  get 'docs/destroy'
  get 'home/index'
  get 'docs/history'

  root 'docs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'application/hello'
end
