Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # namespace for admin
  namespace :admin do
    devise_for :admins, controllers:{
      sessions: 'admin/devise/sessions',
      passwords: 'admin/devise/passwords'
    }
    resources :items
  end
  # namespace for public
  namespace :public do
    devise_for :end_users, controllers:{
      sessions: 'public/devise/sessions',
      registrations: 'public/devise/registrations',
      passwords: 'public/devise/passwwords'
    }
    resources :end_users
    resources :items
  end
end
