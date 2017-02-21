Rails.application.routes.draw do
  devise_for :admins
  devise_for :grupos
  root 'home#home'
  get 'home/home'
end
