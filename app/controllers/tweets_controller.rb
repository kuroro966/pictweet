class TweetsController < ApplicationController
    
   before_action :move_to_index, except: [:index,:show]#indexアクションの場合は実行しない



  def show
    @tweet=Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
    
  end


    
   def index
      @tweets = Tweet.includes(:user).all.order("created_at DESC").page(params[:page]).per(5)
      
      # @tweets = Tweet.all.order("created_at DESC").page(params[:page]).per(5)
      #paramsのキーに自動でpageというキーが追加される、
      #そこに入る数字がページ数となりperの引数5はページあたりの件数
      #pageメソッドとperメソッドで表示すべきインスタンスを割り出し返り値にしてる？
   end
  
  def new
  
  end
  
  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    #nameが不要になったので↑に書き換え Tweet.create(name: tweet_params[:name], image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)


      #userIＤを取得したいので↓を上に書き換え
      #current_userというヘルパーメソッド（ログインしてるUserのインスタンス（レコード）全部取得）
     #  Tweet.create(tweet_params)  #tweet_paramsの返り値、今回で言うと最後の一行そのままがcreateの引数として入る
     #Tweet.create(name:params[:name], image:params[:image], text:params[:text])
     # binding.pry #railsを停止してParamsの中身などを確認
     
  end
  
  
  def destroy
    tweet=Tweet.find(params[:id])
    tweet.destroy if tweet.user_id==current_user.id
  
    
  end
  
  
  def edit
     @tweet = Tweet.find(params[:id])
    
  end
  
    
  
  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end
  
  






  
  
  private 
  def tweet_params
   
      params.permit(:image,:text)#ストロングパラメータ。permitしたキーしか受け取らない
      #nameが不要になったので上に書き換え params.permit(:name,:image,:text)#ストロングパラメータ。permitしたキーしか受け取らない
    
    
  end
  
  def move_to_index
    unless user_signed_in? then
      redirect_to action: :index
    end# ログインしていなかった場合、「index」アクションを実行する
  end
  
  
  
  
  
  
end
