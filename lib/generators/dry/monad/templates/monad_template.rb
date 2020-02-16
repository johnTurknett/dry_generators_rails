require 'dry/monads'

module Monads
  class <%= @class_name %>
    include Dry::Monads[:result]

    def call(params)
      if true
        Success('I am a success')
      else
        Failure('I am a failure')
      end
    end
  end
end
