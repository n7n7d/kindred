Rails.application.routes.draw do
  get 'customers/index'

  get 'customers/show'

  devise_for :customers, :controllers => { :omniauth_callbacks => 'customers/omniauth_callbacks' } do
    delete 'sign_out', :to => 'devise/customer/sessions#destroy', :as => :destroy_customer_session
  end
  get 'sellers/show'

  get 'sellers/index'

  devise_for :sellers
  resources :sellers, only: [:show,:index]
  resources :customers, only: [:show,:index]

  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
end
