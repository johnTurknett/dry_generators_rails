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

      def copy_spec
        if Dir.exist? File.join(Rails.root, 'spec')
          name = file_name.underscore
          path =  File.join(Rails.root, 'spec', 'dry', 'validators')
          spec_template = 'validation_spec_template.rb'
          template spec_template, File.join(path, "#{name}_validator_spec.rb")
        end
      end

      def copy_test
        if Dir.exist? File.join(Rails.root, 'test')
          name = file_name.underscore
          path =  File.join(Rails.root, 'test', 'dry', 'validators')
          test_template = 'validation_test_template.rb'
          template test_template, File.join(path, "#{name}_validator_test.rb")
        end
      end
    end
  end
end
