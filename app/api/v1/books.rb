module V1
  class Books < Grape::API
    resources :books do
      desc 'returns all books', {
        is_array: true,
        success: V1::Entities::BookEntity
      }
      get '/' do
        @books = Book.all
        present @books, with: V1::Entities::BookEntity
      end

      desc 'returns a book', {
        success: V1::Entities::BookEntity
      }
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @book = Book.find(params[:id])
        present @book, with: V1::Entities::BookEntity
      end

      desc 'Create a book', {
        success: V1::Entities::BookEntity
      }
      params do
        requires :title, type: String
        requires :price, type: Integer
        requires :author_id, type: Integer
      end
      post '/' do
        @book = Book.new(
          title: params[:title],
          price: params[:price],
          author_id: params[:author_id]
        )

        if @book.save
          status 201
          present @book, with: V1::Entities::BookEntity
        else
          status 400
          present @book.errors
        end
      end
    end
  end
end
