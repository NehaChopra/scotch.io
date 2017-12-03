Rails.application.routes.draw do
  get 'order_lines/create'

  get 'order_lines/update'

  get 'order_lines/destroy'

  get 'carts/show'

  get 'products/index'

  devise_for :customers, :controllers => { :registrations =>'registration'}

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_lines, only: [:create, :update, :destroy]

  get 'dashboard' => 'home#dashboard'
  get '/error404' => 'home#index'
  get '/error401' => 'home#index'
  get '/error500' => 'home#index'
  get '/*path' => 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root" (root should be defined at the end of routes file)
  root :to =>'home#index' # home page
end
