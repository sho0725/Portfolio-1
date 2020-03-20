Rails.application.routes.draw do

  #初期ページ
  get 'homes/index'
  #aws掲示板
  get 'homes/aws'
  #掲示板新規作成ページ
  get 'homes/new'
  #作成
  post '/users', to: 'homes#create'
  #詳細ページ
  get 'homes/:id/show', to: 'homes#show'
  #更新ページ
  get '/homes/:id/edit', to: 'homes#edit'
  #更新
  patch '/homes/:id', to: 'homes#update'
  #削除
  delete '/homes/:id', to: 'homes#destroy'
  
  
end
