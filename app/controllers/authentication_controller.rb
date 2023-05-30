class AuthenticationController < ApplicationController
  def login
    player = Player.find_by(email: params[:email])
    if player&.authenticate(params[:password])
      token = JWT.encode({ user_id: player.id }, 'your_secret_key', 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def authenticate
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, 'your_secret_key', true, { algorithm: 'HS256' })
    user_id = decoded_token.first['user_id']
    @current_user = Player.find(user_id)
  rescue JWT::DecodeError
    render json: { error: 'Invalid token' }, status: :unauthorized
  end
end
