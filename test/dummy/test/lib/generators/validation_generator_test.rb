require 'test_helper'
require 'generators/validation/validation_generator'

class ValidationGeneratorTest < Rails::Generators::TestCase
  tests ValidationGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
