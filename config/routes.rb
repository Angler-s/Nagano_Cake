Rails.application.routes.draw do


  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get 'homes/about'

    resources :itmes, only: [:index, :show]
    resources :cart_itmes, only: [:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all'
    resources :orders, only: [:new, :index, :show, :create]
    get 'orders/confirm'
    get 'orders/complete'
    resources :destinations, only: [:index, :edit, :create, :update, :destroy]

  end

  namespace :admin do
    resources :items, only: [:new,:index,:show,:edit,:create,:update]
    resources :item_genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  namespace :public do
    get 'customers/show'
    get 'customers/information/edit'
    get 'customers/information/confirm'
    patch 'customers/information' => 'customers#update'
    patch 'customers/quit'


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
