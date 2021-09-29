Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: 'admins/sessions',passwords: 'admins/passwords'}
  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only:[:index, :show]
  resources :customers, only:[:show, :edit, :update]
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  resources :cart_items, only:[:index, :update, :destroy]
  resources :orders, only:[:index, :new, :show, :create]
  post 'orders/comfirm' => 'public/orders#comfirm'
  get 'orders/complete' => 'public/orders#coomplete'
  resources :addresses, except:[:new, :show]

  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except:[:new, :show, :destroy]
    resources :customers, except:[:new, :create, :destroy]
    resources :oders, only:[:show, :update]
    patch 'oders/oder_details' => 'admin/oder_details#update'
  end
end
