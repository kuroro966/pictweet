Rails.application.routes.draw do
  
  devise_for :users
  root "tweets#index"
  
  #get 'tweets' => 'tweets#index'
  #get 'tweets/new' => 'tweets#new'
  #post 'tweets'  =>  'tweets#create'    #ツイート投稿機能'
  #get "users/:id" => "users#show" 
  #:idとすることでコントローラでparams[:id]としたときにURLのidをハッシュで送れる
  #パスを:idというハッシュに変換してコントローラのparamsに渡すことが可能？
  #delete  'tweets/:id'  => 'tweets#destroy'
  #patch   'tweets/:id'  => 'tweets#update'
  #get   'tweets/:id/edit'  => 'tweets#edit'
  #get 'tweets/:id' => 'tweets#show'
 
  resources :tweets do                     #tweets_controllerに対してのresourcesメソッド
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド

  
  
end
