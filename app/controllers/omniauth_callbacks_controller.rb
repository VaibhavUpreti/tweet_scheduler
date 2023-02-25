# frozen_string_literal: true

class OmniauthCallbacksController < ApplicationController
  before_action :authenticate_user!
  def twitter
    # Rails.logger.info auth
    twitter_account = current_user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_account.update(
      name: auth.info.name,
      username: auth.uid,
      image: auth.extra.raw_info.profile_image_url,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )
    redirect_to twitter_accounts_path, notice: "Successfully connected twitter account"
  end

  def auth
    request.env['omniauth.auth']
  end
end