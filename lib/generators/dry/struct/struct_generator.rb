require 'generators/dry'

module Dry
  module Generators
    class StructGenerator < Base
      source_root File.expand_path('templates', __dir__)

      def check_requirements
        raise 'NAME must be provided' unless file_name.present?
      end

      def set_instance_variables
        @name = file_name.underscore
        @class_name = "#{@name.camelize}"
      end

      def copy_struct
        path = File.join(STRUCTS_PATH, "#{@name}.rb")
        template 'struct_template.rb', path
      end

      def copy_spec
        if Dir.exist? File.join(Rails.root, 'spec')
          spec_path =  File.join(SPEC_PATH, 'structs')
          path = File.join(spec_path, "#{@name}_spec.rb")
          template 'struct_spec_template.rb', path
        end
      end

      def copy_test
        if Dir.exist? File.join(Rails.root, 'test')
          test_path =  File.join(TEST_PATH, 'structs')
          path = File.join(test_path, "#{@name}_test.rb")
          template 'struct_test_template.rb', path
        end
      end
    end
  end
end
