Rails.application.routes.draw do
  resources :eventos, :controller => 'eventos'
  resources :admin_in
  resources :admin_admin, :controller => 'admin_in'
  resources :admin_in_grupos, :controller => 'admin_in_grupos'
  resources :ubicacions

  devise_for :admins
  devise_scope :admin do
  	get '/admin' => 'admins/sessions#new'
  	get '/admin/edit' => 'admins/registrations#edit'
  	get '/admin/sign_out' => 'admins/sessions#destroy'
    get '/admin/new' => 'admins/registrations#new'
  end

  devise_for :grupos, controllers: { sessions: 'grupos/sessions' }
  devise_scope :grupo do
  	root 'grupos/sessions#new'
    get '/edit' => 'grupos/registrations#edit'
    get '/sign_out' => 'grupos/sessions#destroy'
  end

  get '/admin/home' => 'admin_in#home'
  get '/admin/admins' => 'admin_in#admins'
  get '/admin/eventos' => 'admin_in#eventos'
  get '/admin/grupos' => 'admin_in#grupos'
  get '/admin/new_admin' => 'admin_in#new_admin'
  patch '/admin_admin.:id' => 'admin_in#update'

  get '/admin/grupo/new' => 'admin_in_grupos#new'
  patch '/admin_in_grupos.:id' => 'admin_in_grupos#update'
  delete '/admin_in_grupos.:id' => 'admin_in_grupos#destroy'
  patch '/admin_in_grupos/update_activo/:id' => 'admin_in_grupos#update_activo'

  patch '/eventos/reservar/:id' => 'eventos#reservar'
  post '/eventos/aviso/:id' => 'eventos#aviso'

  post '/eventos/:id' => 'eventos#cancel'

  get '/home' => 'grupo_in#home'
end
