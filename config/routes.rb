Rails.application.routes.draw do
  #ルートは上から優先度が高くなる
  #:idにはなんでも入る => /signは/id(1)は同じ,idはできるだけ下に置く
  devise_for :admins, controllers: {sessions: 'admins/sessions',passwords: 'admins/passwords'}

  root to: 'homes#top'
  get 'about' => 'homes#about'

  scope module: :public do
    resources :items, only:[:index, :show]
    resource :customers, only:[:edit, :update]
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :cart_items, only:[:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
    end
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only:[:index, :new, :show, :create]
    resources :addresses, except:[:new, :show]
  end


  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except:[:new, :show, :destroy]
    resources :customers, except:[:new, :create, :destroy]
    resources :oders, only:[:show, :update]
    patch 'oders/oder_details' => 'admin/oder_details#update'
  end


  devise_for :customers

end
