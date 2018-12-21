module V1
  class Users < Grape::API
    resources :users do
      desc 'signin'
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post '/signin' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
          @user
        else
          error!('Unauthorized. Invalid email or password.', 401)
        end
      end

      desc 'signup'
      params do
        requires :email, type: String
        requires :password, type: String
        requires :name, type: String
      end
      post '/signup' do
        @user = User.new(declared(params))

        if @user.save
          @user
        else
          @user.errors.full_messages
        end
      end
    end
  end
end
