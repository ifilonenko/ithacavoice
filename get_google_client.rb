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

  def credentials
    Credentials.new()
  end

  def authorization
    Google::APIClient::Storage.new(credentials).authorize
  end
end

p IlansGoogle.new.auth_url