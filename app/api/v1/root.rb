module V1
  class Root < Grape::API
    version :v1
    format :json

    TOKEN_PREFIX = /^Bearer\s/
    TOKEN_REGEX = /^Bearer\s(.+)/
    helpers do
      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def current_user
        return nil unless headers['Authorization'] && headers['Authorization'].match(TOKEN_REGEX)
        token = headers['Authorization'].gsub(TOKEN_PREFIX, '')
        User.find_by(token: token)
      end
    end

    mount V1::Users
    mount V1::Authors
    mount V1::Books
  end
end
