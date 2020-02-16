module Dry
  module Generators
    class Base < Rails::Generators::NamedBase
      DRY_PATH = File.join(Rails.root, 'app', 'dry').freeze
      SPEC_PATH = File.join(Rails.root, 'spec', 'dry').freeze
      TEST_PATH = File.join(Rails.root, 'test', 'dry').freeze

      VALIDATIONS_PATH = File.join(DRY_PATH, 'validations').freeze
      STRUCTS_PATH = File.join(DRY_PATH, 'structs').freeze
    end
  end
end
