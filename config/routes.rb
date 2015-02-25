RogueTattoo::Application.routes.draw do
  get 'dashboard' => "home#dashboard"
  get 'edit_admins' => 'home#edit_admins'
  get 'admin_edit_images' => 'home#admin_edit_images'
  delete 'delete_admin' => 'home#delete_admin'
  get 'display_images' => 'home#display_images'
  get 'list' => 'artist#list'
  #get 'artist/:id' => redirect('http://www.rogue-tattoo.com/#!/view_artist/:id')
  
  resources :artist
  resources :makeupartist
  resources :image
  resources :makeupimage
  resources :newspost
  
  devise_for :admins
  
  #devise_scope :admin do
  #    get 'superuser' => "devise/registrations#new"
  #end
  
  get "home/index"

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '*path' => redirect('/')
  #get "/*path" => redirect("/?goto=%{path}")
end
