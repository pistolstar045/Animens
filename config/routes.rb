Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords]

   root to: "homes#top"

  get 'customers/index' => 'customers#index', as:'customers'
  get "customers/show" => "customers#show", as:"customers_my_page"
  get 'customers/information/edit' => 'customers#edit', as: 'edit_customer'
  patch 'customers/information' => 'customers#update', as: 'update_customer'
  get "customers/unsubscribe" => "customers#unsubscribe", as:"unsubscribe"
  patch "customers/withdraw" => "customers#withdraw", as:"withdraw"

  resources :animes do
   resource :favorites, only: [:create, :destroy]
   resources :anime_comments, only: [:create, :destroy]
  end

  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
   resource :group_customers, only: [:create, :destroy]
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

