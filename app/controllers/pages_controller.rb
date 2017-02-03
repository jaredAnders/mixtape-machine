class PagesController < ApplicationController
  def index
    if user_signed_in?
      # token = session[:omniauth][:credentials][:token]
      # response = `curl -X GET "https://api.spotify.com/v1/users/1262470196/playlists?limit=3" -H "Accept: application/json" -H "Authorization: Bearer BQDkQiXUrPW6JkBrKd0Vi2Dzi7dBwPjla1B0WkkEhsV9PF1DZUrQZF7K2PLsk4FE7Yh8PnUUu93QRzgIdj6Ry41XJ3ybZe6wb-Ve9BOgglrOC3VA_AxYD30ha5QwViGt13spWJoqfEKzNtT5dea08fKkj-_w2nOolnzdCgzTrKMJqeS5Jt_J5VLSUnvA-kTX0zx9-zTMf1AtQQ1kDLZ9vys9yRyDgl_G5Kes-NhZCFmQJm88z9WDj5OzjzTX0S_29Meu0Or-nHzaI_ARHw6Wkt4"`
      # top_playlists = JSON.parse(response)

      @user = RSpotify::User.new(session[:omniauth])
      @artists = RSpotify::Artist.search('Tobacco').first
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
