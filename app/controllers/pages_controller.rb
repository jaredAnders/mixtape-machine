class PagesController < ApplicationController
  def index
    if user_signed_in?
      @user = RSpotify::User.new(session[:omniauth]).credentials
      @id = session[:omniauth]["extra"]["raw_info"]["id"]
      token = @user["token"]

      playlists_response = `curl -X GET "https://api.spotify.com/v1/me/playlists" -H "Accept: application/json" -H "Authorization: Bearer #{token}"`

      recent_5_response = `curl -X GET "https://api.spotify.com/v1/me/tracks?limit=5" -H "Accept: application/json" -H "Authorization: Bearer #{token}"`

      # top_5_response = `curl -X GET "https://api.spotify.com/v1/me/top/tracks?limit=5" -H "Accept: application/json" -H "Authorization: Bearer #{token}"`

      # refresh = `curl -H "Authorization: Basic ZjM4Zj...Y0MzE=" -d grant_type=refresh_token -d refresh_token=#{refresh_token} https://accounts.spotify.com/api/token`

      @playlists = JSON.parse(playlists_response).first
      @recent_5_tracks = JSON.parse(recent_5_response)["items"]
      # @top_5_tracks = JSON.parse(top_5_response)
      # binding.pry


      # binding.pry


      # @artists = RSpotify::Artist.search('Tobacco').first



    end
  end

  # def spotify_callback
  #   auth_code = params[:code]
  #   auth_code ||= "AQCfcvwJk3H4MCJH4YDk4urIoc3srg5Q92XLr0vpSOu8fkPyRfxpAL7o9cyrBtESsypPSmAzT5iznNPmR1E9Ke9Dat59GQphd5WVHOz19N8zgs1YemUyGgvj8UP_ENwTEde6U8k3QopfOp2Cv7xxZtZBDMPTLiGzFz7zgQ1Aie4a0IlGFXe4raYToBA9as6RktKfE417G7nHEZLYgVMDov_iPM_JKYcLvu6xOAQIOGpIP9dXjb4uHFB6gaT161lMZRnxHY6einl7JH8-"
  #
  #   http = Net::HTTP.new("accounts.spotify.com")
  #   http.ssl_version = :SSLv3
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #
  #   request = Net::HTTP::Post.new("/api/token")
  #   request.set_form_data({
  #     "grant_type" => "authorization_code",
  #     "code" => auth_code,
  #     "redirect_uri" => @redirect_uri
  #     })
  #   @response = http.request(request)
  # end
  #
  # def set_redirect_uri
  #   @redirect_uri = CGI.escape("#{ENV['SPOTIFY_CALLBACK']}/spotify-callback")
  # end
end
