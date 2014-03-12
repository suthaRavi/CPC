CPC::Application.routes.draw do

  devise_scope :user do
    root :to => "home#index"
  end

  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions",
    :passwords => "passwords", :confirmations => "confirmations", :mailer => "mailer"}

  devise_scope :user do get "/mailer/confirmation_instructions" => "mailer#confirmation_instructions" end
  devise_scope :user do get "/registrations/term" => "registrations#term" end
  devise_scope :user do get "/sessions/thankyou" => "sessions#thankyou" end
  devise_scope :user do get "/registrations/policy" => "registrations#policy" end
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
