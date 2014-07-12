class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session_token = SecureRandom.base64
    user.update!(session_token: session_token)
    session[:session_token] = session_token
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    current_user.update!(session_token: SecureRandom.base64)
    session[:session_token] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
