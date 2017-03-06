Rails.application.routes.draw do
  resources :eventos
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

  get '/home' => 'grupo_in#home'
end
