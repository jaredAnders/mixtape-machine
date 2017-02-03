class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def spotify
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:omniauth] = request.env['omniauth.auth'].to_hash

    # spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # @top = spotify_user.top_artists.slice(0,5)
    # binding.pry

    if @user.persisted?
      set_flash_message(:notice, :success, :kind => 'Spotify') if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session['devise.spotify_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
