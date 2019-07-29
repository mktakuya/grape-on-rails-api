module V1
  module Entities
    class AuthorEntity < Grape::Entity
      expose :id, documentation: { type: 'integer', required: true }
      expose :name, documentation: { type: 'string', required: true }
    end
  end
end
