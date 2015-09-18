Rails.application.routes.draw do
  root 'books#index'

  devise_for :admins, :controllers => {
    :sessions      => "admins/sessions",
    :registrations => "admins/registrations",
    :passwords     => "admins/passwords"
  }

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }
  resources :books do 
    resources :stocks, except: [:show] do
      resources :reservations, only: [:index, :create, :update, :edit, :destroy]
    end
    resources :reviews, only: [:create, :update, :edit, :destroy]
    resources :bookmarks, only: [:create, :update, :edit, :destroy]
  end

  resources :authors, except: [:show]
  resources :genres, except: [:show]
  resources :publishers, except: [:show]
  resources :reservation_statuses, except: [:show]
  resources :application_statuses, except: [:show]
  resources :new_books, except: [:show] do
    resources :applications, except: [:show]  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
