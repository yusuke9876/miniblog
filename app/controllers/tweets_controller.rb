class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      flash[:success] = 'Tweet が正常に投稿されました'
      redirect_to @tweet
    else
      flash.now[:danger] = 'Tweet が投稿されませんでした'
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      flash[:success] = 'Tweet は正常に更新されました'
      redirect_to @tweet
    else
      flash.now[:danger] = 'Tweet は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    flash[:success] = 'Tweet は正常に削除されました'
    redirect_to tweets_url
  end
  
  private
  
  def tweet_params
    params.require(:tweet).permit(:content)
  end
  
end
