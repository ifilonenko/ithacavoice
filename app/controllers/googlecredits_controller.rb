class GooglecreditsController < ApplicationController
  def create_tokens
    @oauth = params[:code]
    p @oauth
    redirect_to root_path
  end
end
