Rails.application.routes.draw do
  devise_for :sellers
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/about'
end
