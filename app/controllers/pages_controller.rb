class PagesController < ApplicationController
  before_action :set_redirect_uri

  def index
    @client_id = ENV['SPOTIFY_CLIENT_ID']
  end

  def spotify_callback
    auth_code = params[:code]
    auth_code ||= "AQCfcvwJk3H4MCJH4YDk4urIoc3srg5Q92XLr0vpSOu8fkPyRfxpAL7o9cyrBtESsypPSmAzT5iznNPmR1E9Ke9Dat59GQphd5WVHOz19N8zgs1YemUyGgvj8UP_ENwTEde6U8k3QopfOp2Cv7xxZtZBDMPTLiGzFz7zgQ1Aie4a0IlGFXe4raYToBA9as6RktKfE417G7nHEZLYgVMDov_iPM_JKYcLvu6xOAQIOGpIP9dXjb4uHFB6gaT161lMZRnxHY6einl7JH8-"

    http = Net::HTTP.new("accounts.spotify.com")
    http.ssl_version = :SSLv3
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new("/api/token")
    request.set_form_data({
      "grant_type" => "authorization_code",
      "code" => auth_code,
      "redirect_uri" => @redirect_uri
      })
    @response = http.request(request)
  end

  def set_redirect_uri
    @redirect_uri = CGI.escape("#{ENV['SPOTIFY_CALLBACK']}/spotify-callback")
  end
end
