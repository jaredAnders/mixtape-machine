class PagesController < ApplicationController
  def index
    @redirect_uri = CGI.escape("#{ENV['SPOTIFY_CALLBACK']}/spotify-callback")
    @client_id = ENV['SPOTIFY_CLIENT_ID']
  end

  def spotify_callback
    session[:spotify_auth_code] = params[:code]
    http = Net::HTTP.new("accounts.spotify.com")

    request = Net::HTTP::Post.new("/api/token")
    request.set_form_data({
      "grant_type" => "authorization_code",
      "code" => ENV['SPOTIFY_CODE'],
      "redirect_uri" => @redirect_uri
      })
    response = http.request(request)
  end
end
