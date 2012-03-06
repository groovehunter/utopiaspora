Utopiaspora::Application.routes.draw do
  resources :profiles


  controller :publics do
    get '.well-known/host-meta' => :host_meta
  end


  ### up to now, default devise, but new session = sign_in should get 
  # own form with username instead of email
  #devise_for :users
  devise_for :users, :controllers => {
                                      #:registrations => "registrations",
                                      :password      => "devise/passwords",
                                      :sessions      => "sessions",
                                    } do
                                     # :invitations   => "invitations"} do
#    get 'invitations/resend/:id' => 'invitations#resend', :as => 'invitation_resend'
#    get 'invitations/email' => 'invitations#email', :as => 'invite_email'
  end
 
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
