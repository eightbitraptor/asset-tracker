ActionController::Routing::Routes.draw do |map|
  
  #map.connect   'users/:left', :controller => 'users', :action => 'index'
  map.resources :users
  map.resources :softwares
  map.resources :hardwares
  map.resources :hardware_types

  map.root :controller => "homepage"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
