# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode({user_id: user.id})
      render json: {auth_token: auth_token, user: user}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end