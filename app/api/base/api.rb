module Base
  class API < Grape::API
    mount V1::Root
  end
end
