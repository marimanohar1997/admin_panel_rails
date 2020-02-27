class AuthenticationController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authorize_request, except: :login

  require "json_web_token"
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 1.hours.to_i
      render json: {token: token,user_id: @user.id,time: time}, status: :ok
    else
      render json: {error: 'Email or password is incorrect' }, :status => 401
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

end
