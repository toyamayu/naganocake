Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public/items#index'
# devise_for admins
  devise_for :admins, controllers:{
      sessions: 'admin/devise/sessions',
      passwords: 'admin/devise/passwords'
    }
# devise_for end_users
  devise_for :end_users, controllers:{
      sessions: 'public/devise/sessions',
      registrations: 'public/devise/registrations',
      passwords: 'public/devise/passwwords'
    }
  
  # namespace for admin
  namespace :admin do
    resources :end_users
    resources :items
    resources :genres
  end
  # namespace for public
  namespace :public do
    
    resources :end_users
    get 'end_user/:id/taikai' => 'end_users#taikai',as: 'taikai_end_user'
    put 'end_user/:id/taikai' => "end_users#destroy", as: 'end_users_destroy'
    delete 'cart_items'=> "cart_items#cleare", as: 'cart_items_cleare'
    
    # orders action
    get 'orders/check' => "orders#check", as: 'order_check'
    post 'orders/new' => "orders#create_session"
    get 'orders/done' => "orders#done", as: 'order_done'
    post 'orders/done' => "orders#done"
    resources :items
    resources :cart_items
    resources :orders
  end
end
