require 'generators/dry'

module Dry
  module Generators
    class ValidationGenerator < Base
      source_root File.expand_path('templates', __dir__)
      PATH = File.join(Rails.root, 'dry', 'validators').freeze

      def copy_validator
        raise 'NAME must be provided' unless file_name.present?
        name = file_name.underscore
        template 'validation_template.rb', File.join(PATH, "#{name}_validator.rb")
      end
    end
  end
end
