Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'customers/index'

  get 'customers/show'

  devise_for :customers, :controllers => { :omniauth_callbacks => 'customers/omniauth_callbacks' ,registrations: 'registrations'} do
    delete 'sign_out', :to => 'devise/customer/sessions#destroy', :as => :destroy_customer_session
  end
  get 'sellers/show'

  get 'sellers/index'
  devise_for :sellers, controllers: { registrations: 'registrations' }
  resources :sellers
  resources :photos
  resources :houses
  resources :customers
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
end
