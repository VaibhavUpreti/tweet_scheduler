# frozen_string_literal: true

class TweetsController < ApplicationController
    before_action :authenticate_user!
  #  before_action :set_twitter_account, only: [:destroy]

    def index
        @tweets = current_user.tweets
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = current_user.tweets.new(tweet_params)
        if @tweet.save
            redirect_to tweets_path, notice: "Tweet was scheduled successfully"
        else
            render :new
        end
    end



    def destroy
      # @twitter_accounts = current_user.twitter_accounts.find(params[:id])
      # @twitter_account.destroy
     # redirect_to root_path, notice: "Successfully disconnected "
    end

  private

  def set_twitter_account
  #  @twitter_account = current_user.twitter_accounts.find(params[:id])
  end


  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end


end