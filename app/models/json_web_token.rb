# The secret must be a string. With OpenSSL 3.0/openssl gem `<3.0.1`, JWT::DecodeError will be raised if it isn't provided.
hmac_secret = 'my$ecretK3y'

token = JWT.encode payload, hmac_secret, 'HS256'

# eyJhbGciOiJIUzI1NiJ9.eyJkYXRhIjoidGVzdCJ9.pNIWIL34Jo13LViZAJACzK6Yf0qnvT_BuwOxiMCPE-Y
puts token

decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

# Array
# [
#   {"data"=>"test"}, # payload
#   {"alg"=>"HS256"} # header
# ]
puts decoded_token

SECRET_KEY = Rails.application.secrets.secret_key_base

class JsonWebToken
    def self.encode(dado, exp = 1.year)
        dado[:exp] = exp
        JWT.encode(dado, SECRET_KEY)
    end

    def self.decode(dado)
        decoded = JWT.decode(dado, SECRET_KEY)[0]
        HashWithIndifferentAccess.new(decoded)
    end
end