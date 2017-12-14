Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: "home#index"

  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :opportunities

  get '/details/edit', to: 'home#edit', as: 'details'
  get '/sign_up', to: 'home#sign_up'
  post '/verify', to: 'home#verify'
  get '/partners', to: 'home#partners'
  put '/details/update', to: 'home#update'
  post '/auth/check_email', to: 'home#check_if_email_exist'
  get '/testproxy.php', to: 'home#index'
  post '/auth/participate_in_beta', to: 'home#participate_in_beta'
  post '/auth/check_coupon', to: 'home#check_coupon'
  post '/auth/redeem_coupon', to: 'home#redeem_coupon'
  post '/opportunities/change_in_watchlist', to: 'opportunities#change_in_watchlist'
  get '/opportunity/testopp', to: 'opportunities#testopp'
  get '/please-wait', to: 'home#org_not_verified', as: 'org_not_verified'


  # legacy route mounting, leaving for convenience
  # @clearme
  # mount Coupons::Engine => '/', as: 'coupons_engine'

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
