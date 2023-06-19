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
    get '/about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]
    resources :item_genres, only: [:show]

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

    resources :destinations, only: [:index, :edit, :create, :update, :destroy]

    get 'customers' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/information' => 'customers#update'
    patch 'customers/quit'

  end

  namespace :admin do
    get '/' => 'homes#top'

    resources :items, only: [:new,:index,:show,:edit,:create,:update]
    resources :item_genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
