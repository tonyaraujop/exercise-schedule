class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  def encode_jwt
    payload = { id: id, timestamps: Time.now }
    self.jwt_key = JWT.encode payload, ENV['HMAC_SECRET'], 'HS256'
    self.save
  end

  def decode_jwt
    JWT.decode jwt_key, ENV['HMAC_SECRET'], true, { algorithm: 'HS256' }
  end
end
