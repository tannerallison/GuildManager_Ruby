class ApplicationController < ActionController::API

  def authenticate
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JWT.decode(token, 'your_secret_key', true, { algorithm: 'HS256' })
    user_id = decoded_token.first['user_id']
    @current_user = Player.find(user_id)
  rescue JWT::DecodeError
    render json: { error: 'Invalid token' }, status: :unauthorized
  end
end
