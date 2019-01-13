class UsersController < ApplicationController
  def show
    
    
  user = User.find(params[:id])
  #ユーザーコントローラのshowメソッドなので、params[:id]にはshow.htmlでユーザーボタンを押したときの
  #"/users/#{comment.user_id}"が入っており、コメント主のUserIDが取得されている
  
  
  #@nickname = Tweet.where(:id).nickname
  @nickname = user.nickname
  @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC") 
  #current_userはuserテーブルのインスタンス（ログイン中のIDの分）が入ってるので
  #そこからtweetsと続けばログイン中のユーザーのTweetテーブルをすべて取得できる
  # @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  # @tweets = Tweet.where(:id).text
  
  end
  
end
