class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end 
  
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end

  def index
    @tweets = Tweet.all
    @rank_tweets = Tweet.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:music_name, :music_artist, :music_year, :music_genre, :favorite_point, :review, :favorite_phrase, :favorite_time, :mv_url, :music_url, :youtube_url, :apple)
  end
end
