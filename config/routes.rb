Rails.application.routes.draw do
  get 'results/crawl'

  get 'results/nokogiri'

  get 'results/compare'

  get 'results/results'

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
