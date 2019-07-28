module V1
  class Authors < Grape::API
    resources :authors do
      desc 'returns all authors', {
        is_array: true,
        success: V1::Entities::AuthorEntity
      }
      get '/' do
        @authors = Author.all
        present @authors, with: V1::Entities::AuthorEntity
      end

      desc 'returns an author', {
        success: V1::Entities::AuthorEntity
      }
      params do
        requires :id, type: Integer, desc: 'Author ID'
      end
      get '/:id' do
        @author = Author.find(params[:id])
        present @author, with: V1::Entities::AuthorEntity
      end

      desc 'Create an author', {
        success: V1::Entities::AuthorEntity
      }
      params do
        requires :name, type: String, desc: 'Author name'
      end
      post '/' do
        authenticate!

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
        requires :id, type: Integer, desc: "Author ID"
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
