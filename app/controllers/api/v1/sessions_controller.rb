class Api::V1::SessionsController < Api::ApiController

  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      token = JWT.encode({ sub: user.id }, Rails.application.credentials.jwt_secret_key, 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
