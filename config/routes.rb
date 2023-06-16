Rails.application.routes.draw do

  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/index'
  end
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
  end

  namespace :admin do
    resources :items, only: [:new,:index,:show,:edit,:create,:update]
    resources :item_genres, only: [:index,:edit,:create,:update]
    resources :customers, only: [:index,:show,:edit,:update]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
