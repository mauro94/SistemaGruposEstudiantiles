Rails.application.routes.draw do
  devise_for :admins
  devise_scope :admin do
	get '/admin' => 'admins/sessions#new'
	get '/admin/edit' => 'admins/registrations#edit'
	get '/admin/sign_out' => 'admins/sessions#destroy'
  end

  devise_for :grupos, controllers: { sessions: 'grupos/sessions' }
  devise_scope :grupo do
	root 'grupos/sessions#new'
  get '/edit' => 'grupos/registrations#edit'
  get '/sign_out' => 'grupos/sessions#destroy'
  end

  #admin routes
  get '/admin/home' => 'admin_in#home'
  get '/admin/admins' => 'admin_in#show_admins'
  get '/admin/eventos' => 'admin_in#show_eventos'
  get '/admin/grupos' => 'admin_in#show_grupos'
  get '/admin/new' => 'admin_in#new_admin'

  #groups routes
  get '/home' => 'grupo_in#home'
end
