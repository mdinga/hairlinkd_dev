Rails.application.routes.draw do


  root 'home#index'


  get 'admin', :to => 'admin_access#menu'
  get 'admin_access/login'
  get 'admin_access/menu'
  post 'admin_access/attempt_login'
  get 'admin_access/logout'


  get 'client_access/login'
  get 'client_access/menu'
  post 'client_access/attempt_login'
  get 'client_access/logout'
  get 'client_access/forgot'
  post 'client_access/attempt_reset'


  get 'stylist_access/stylist_login'
  get 'stylist_access/stylist_menu'
  post 'stylist_access/stylist_attempt_login'
  get 'stylist_access/stylist_logout'


    resources :stylists do
        member do
          get :delete
          get :new_stylist_rating
          post :create_stylist_rating
          get :new_portfolio
          post :create_portfolio
        end
      end

      resources :clients do
        member do
          get :delete
          get :show_stylists
          get :show_style
          post :create_fav_styles
          delete :destroy_fav_styles
          post :create_fav_stylists
          delete :destroy_fav_stylists
        end

        collection do
          get :index_stylists
          get :index_styles
        end
      end

      resources :ratings do
        member do
          get :delete
          get :show_admin
        end
      end

      resources :styles do
        member do
          get :delete
        end
      end

      resources :portfolios do
        member do
          get :delete
          get :show_client
          get :show_stylist
          get :show_admin
        end
      end

      resources :admins do
        member do
          get :delete
          get :show_client
          get :edit_client
          patch :update_client
          get :delete_client
          delete :destroy_client
          get :show_stylist
          get :edit_stylist
          patch :update_stylist
          get :delete_stylist
          delete :destroy_stylist
          get :show_rating
          get :edit_rating
          patch :update_rating
          get :delete_rating
          delete :destroy_rating
          get :show_portfolio
          get :edit_portfolio
          patch :update_portfolio
          get :delete_portfolio
          delete :destroy_portfolio

        end
        collection do
          get :index_stylists
          get :index_ratings
          get :index_portfolios
        end
      end


      resources :hairstyles do
        member do
          get :delete
        end
      end

      resources :services do
        member do
          get :delete
        end
      end



      resources :cities do
        member do
          get :delete
        end
      end

      resources :areas do
        member do
          get :delete
        end
      end

      resources :contact_forms do
        member do
          get :delete
        end
      end



end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
