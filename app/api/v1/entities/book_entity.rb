module V1
  module Entities
    class BookEntity < Grape::Entity
      expose :id, documentation: { type: 'integer', required: true }
      expose :title, documentation: { type: 'string', required: true }
      expose :price, documentation: { type: 'integer', required: true }
      expose :tax_included_price, documentation: { type: 'integer', required: true } do |instance, options|
        instance.price * 1.08
      end
      expose :author, using: V1::Entities::AuthorEntity, documentation: { required: true }
    end
  end
end
