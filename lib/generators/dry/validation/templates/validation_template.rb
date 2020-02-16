module Validations
  class <%= file_name.camelize %> < Dry::Validation::Contract
    params do
      # required(:age).filled(:integer)
    end

    # rule(:age) { key.failure("must be greater than 18") if value < 18 }
  end
end
