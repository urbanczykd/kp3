ActionController::Routing::Routes.draw do |map|


#  map.connect 'zgloszenia', :controller => "zgloszenias", :action => "new"
#map.zgloszenia 'zgloszenia', :controller => "zgloszenias", :action => "new"
map.resources :zgloszenias, :as => 'zgloszenia'
#map.resources 'zgloszenia', :controller => "zgloszenias"
#map.connect 'zgloszenia/:id', :controller => 'zgloszenias', :action => 'new'
#map.login "admin/login", :controller => "user_sessions", :action => "new"
#  map.resources :covers
map.wydarzenia 'wydarzenia/:id', :controller => "wydarzenia", :action => "index"
map.kalendarium 'kalendarium/:id', :controller => "kalendarium", :action => "index"
##################
#map.connect 'muzyka/', :controller => "muzyka", :action => "index"
#map.connect 'muzyka/:id', :controller => "muzyka", :action => "view"


###################################
#  map.resources :kalendariums
  map.resources :rozmaitosci
  map.resources :muzea
  map.resources :ksiazki
  map.resources :film
  map.resources :teatr
  map.resources :galerie
  map.resources :archiwums
#  map.resources :wydarzenias
  map.resources :muzyka
##################################
  map.resources :szukaj
  map.resources :user_sessions
  map.resources :home
  map.resources :users

################################################################################
	map.namespace :admin do |admin|
		admin.resources :magazines, :has_one => :cover
		admin.resources :magazines, :has_one => :eversion
		admin.resource :magazines, :collection => {:arch => :put}
		admin.resources :magazines, :has_many => :events
    admin.resources :sponsors
  
      admin.resources :magazines do |magazine|
        magazine.resources :topones, :collection => { :move => :put }
        magazine.resources :soons, :collection => {:move => :put}
        magazine.resources :eventsorts
      end
################################################################
		admin.resources :archiwes
		admin.resource :archiwes, :collection => {:unarch => :put}
		admin.resources :users, :collection => {:move => :put}
    admin.resources :notis
		admin.resources :categories
		admin.resources :places
		admin.resources :eventdays

    admin.resources :egalleries do |egallery|
       egallery.resources :egalleryps, :collection => { :move => :put }
    end
    admin.resources :iadres, :collection => {:move => :put}
  end
################################################################################

map.register "admin/register", :controller => "users", :action => "new"
map.register "admin/rejestracja", :controller => "users", :action => "new"
map.login "admin/login", :controller => "user_sessions", :action => "new"
map.login "admin", :controller => "user_sessions", :action => "new"
map.logout "admin/logout", :controller => "user_sessions", :action => "destroy"
#map.new "admin/new", :controller => "users", :action => "new"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"
 map.root :controller => "wydarzenia", :action => "index"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
