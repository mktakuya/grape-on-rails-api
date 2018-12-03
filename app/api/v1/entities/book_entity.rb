module V1
  module Entities
    class BookEntity < Grape::Entity
      expose :id
      expose :title
      expose :price do |instance, options|
        instance.price * 1.08
      end
    end
  end
end
