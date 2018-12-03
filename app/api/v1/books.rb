module V1
  class Books < Grape::API
    resources :books do
      desc 'returns all books'
      get '/' do
        @books = Book.all
      end

      desc 'returns a book'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @book = Book.find(params[:id])
      end

      desc 'Create a book'
      params do
        requires :title, type: String
        requires :price, type: Integer
        requires :author_id, type: Integer
      end
      post '/' do
        @book = Book.create(
          titile: params[:title],
          price: params[:price],
          author_id: params[:author_id]
        )
      end
    end
  end
end
