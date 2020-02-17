require 'generators/dry'

module Dry
  module Generators
    class ValidationGenerator < Base
      source_root File.expand_path('templates', __dir__)
      class_option :params, type: :array, default: []

      def check_requirements
        raise 'NAME must be provided' unless file_name.present?
      end

      def set_instance_variables
        @name = file_name.underscore
        @class_name = "#{@name.camelize}"
        @fields = []
      end

      # [:name, :type, :required]
      def process_params
        options['params'].each do |field|
          fields = field.split(':')
          required = false
          type = 'string'

          if fields.length == 3
            required = true
            fields.pop
          end

          type = fields.pop if fields.length == 2
          @fields << { name: fields.first, type: type, required: required }
        end
      end

      def copy_validator
        path = File.join(VALIDATIONS_PATH, "#{@name}.rb")
        template 'validation_template.erb', path
      end

      def copy_spec
        if Dir.exist? File.join(Rails.root, 'spec')
          spec_path =  File.join(SPEC_PATH, 'validations')
          path = File.join(spec_path, "#{@name}_spec.rb")
          template 'validation_spec_template.erb', path
        end
      end

      def copy_test
        if Dir.exist? File.join(Rails.root, 'test')
          test_path =  File.join(TEST_PATH, 'validations')
          path = File.join(test_path, "#{@name}_test.rb")
          template 'validation_test_template.erb', path
        end
      end
    end
  end
end
