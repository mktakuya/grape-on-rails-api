module V1
  class Authors < Grape::API
    resources :authors do
      desc 'returns all authors'
      get '/' do
        @authors = Author.all
        present @authors, with: V1::Entities::AuthorEntity
      end

      desc 'returns an author'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @author = Author.find(params[:id])
        present @author, with: V1::Entities::AuthorEntity
      end

      desc 'Create an author'
      params do
        requires :name, type: String
      end
      post '/' do
        @author = Author.new(name: params[:name])

        if @author.save
          status 201
          present @author, with: V1::Entities::AuthorEntity
        else
          status 400
          present @author.errors
        end
      end

      desc 'Delete an author'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @author = Author.find(params[:id])

        if @author.destroy
          status 204
          present nil
        else
          status 400
          present @author.errors
        end
      end
    end
  end
end
