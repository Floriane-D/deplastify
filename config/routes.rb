Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'profile', to: 'pages#profile'
  get 'results', to: 'pages#results'

  resources :vouchers, only: :update

  resources :stores do
    member do
      patch :checkqr
    end
    resources :benefits, only: [:new, :create, :edit, :update, :destroy, :index] do
      resources :vouchers, only: [:create, :edit, :show]
    end
  end

  get '/stores/:id/scanqr', to: 'stores#scanqr', :as => :store_scan_qr
  # patch '/stores/:id/checkqr', to: 'stores#checkqr', :as => :store_check_qr

end
