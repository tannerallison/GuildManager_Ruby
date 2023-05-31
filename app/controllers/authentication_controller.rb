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

  # POST /register
  # {
  #  "username": "test",
  #  "email": "test@test",
  #  "password": "test"
  # }
  def register
    if Player.find_by(email: params[:email])
      throw :error, status: :bad_request, message: 'Email already exists'
    end

    player = Player.new(username: params[:username], email: params[:email], password: params[:password])
    if player.save
      render json: player, status: :created
    else
      render json: player.errors, status: :unprocessable_entity
    end
  end
end
