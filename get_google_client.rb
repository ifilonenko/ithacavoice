require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/storage'

class IlansGoogle
  def client_secrets
    @client_secrets ||= Google::APIClient::ClientSecrets.load("#{Dir.pwd}/client_secret.json")
  end

  def base_client
    redirect_base = 'http://localhost:3000'
    @base_client ||= client_secrets.to_authorization
    @base_client.update!(
      scope: 'https://www.googleapis.com/auth/drive',
      approval_prompt: 'force',
      access_type: 'offline',
      redirect_uri: "#{redirect_base}/oauth/callback"
    )
  end

  def auth_url
    base_client.authorization_uri.to_s
  end

  # class Credentials
  #   def initialize(params)
  #     @access_token = params[:access_token]
  #     @refresh_token = params[:refresh_token]
  #     @expires_at = params[:expires_at]
  #   end

  #   def load_credentials
  #     {
  #       access_token: @access_token,
  #       authorization_uri: AUTH_URI,
  #       expires_in: 3600,
  #       refresh_token: @refresh_token,
  #       token_credentials_uri: TOKEN_CREDENTIALS_URI,
  #       issued_at: (@expires_at - 60.seconds).to_i,
  #       client_id: CLIENT_ID,
  #       client_secret: CLIENT_SECRET,
  #       grant_type: 'authorization_code'
  #     }
  #   end

  #   def write_credentials(_)
  #     return
  #   end
  # end

  def credentials
    Credentials.new()
  end

  def authorization
    Google::APIClient::Storage.new(credentials).authorize
  end
end

p IlansGoogle.new.auth_url