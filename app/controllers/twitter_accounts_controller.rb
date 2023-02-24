# frozen_string_literal: true

class TwitterAccountsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_twitter_account, only: [:destroy]

    def index
        @twitter_accounts = current_user.twitter_accounts
    end

    def destroy
      # @twitter_accounts = current_user.twitter_accounts.find(params[:id])
      # @twitter_account.destroy
      redirect_to root_path, notice: "Successfully disconnected "
    end

  private

  def set_twitter_account
    @twitter_account = current_user.twitter_accounts.find(params[:id])
  end
end