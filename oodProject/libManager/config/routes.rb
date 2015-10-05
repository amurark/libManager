Rails.application.routes.draw do

  resources :histories
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :books
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#signUp'

  # get    'login'   => 'sessions#new'
  # post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'

  get '/signup' => 'users#signUp'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

  get 'books' => 'books#index'



  #for complete list of books
  get 'full' => 'books#full'

  #for books available for checkout
  get 'available' => 'books#available'

  #for searching books via ISBN
  get 'searchisbn' => 'books#searchisbn'

  #for displaying books searched via ISBN
  get 'fullsearchisbn' => 'books#fullsearch'

  #for searching books via title
  get 'searchtitle' => 'books#searchtitle'

  #for displaying books searched via title
  get 'fullsearchtitle' => 'books#fullsearch'

  #for searching books via Author
  get 'searchauthor' => 'books#searchauthor'

  #for displaying books searched via author
  get 'fullsearchauthor' => 'books#fullsearch'

  #for searching books via Description
  get 'searchdescription' => 'books#searchdescription'

  #for displaying books searched via Description
  get 'fullsearchdescription' => 'books#fullsearch'




  #get 'static_pages/signUp'
  # get 'login' => 'static_pages#login'
  # get 'login/admin' => 'static_pages#loginAdmin'
  # get 'login/patron' => 'static_pages#loginPatron'

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
