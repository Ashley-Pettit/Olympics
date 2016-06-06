Rails.application.routes.draw do

  #Home Dir
  root 'event#index'

  #Main page
  get 'event/index' => 'event#index'

  #Admin routes
  get 'admin/index' => 'admin#index'

  get 'admin/new' => 'admin#new'
  post 'admin/create' => 'admin#create'

  get 'admin/edit' => 'admin#edit'
  patch 'admin/update' => 'admin#update'
  delete 'admin/destroy' => 'admin#destroy'


end
