class Api::ApiController < ActionController::API

  def jwt_user
    token = request.headers['Authorization']&.split(' ')&.last
    payload = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true, algorithm: 'HS256') rescue nil

    if payload.nil?
      nil
    else
      user = User.find_by(id: payload.first['sub'])
      if user
        user
      else
        nil
      end
    end
  end
end
