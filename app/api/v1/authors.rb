module V1
  class Authors < Grape::API
    resources :authors do
      desc 'returns all authors'
      get '/' do
        @authors = Author.all
      end

      desc 'returns an author'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @author = Author.find(params[:id])
      end

      desc 'Create an author'
      params do
        requires :name, type: String
      end
      post '/' do
        @author = Author.create(name: params[:name])
      end

      desc 'Delete an author'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @author = Author.find(params[:id])
        @author.destroy
      end
    end
  end
end
