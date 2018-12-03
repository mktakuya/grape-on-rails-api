module V1
  module Entities
    class AuthorEntity < Grape::Entity
      expose :id
      expose :name
      expose :books, using: V1::Entities::BookEntity
    end
  end
end
