require 'test_helper'
require 'generators/dry/validation/validation_generator'

class Dry::Generators::ValidationGeneratorTest < Rails::Generators::TestCase
  tests Dry::Generators::ValidationGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  test 'runs successfully when name is provided' do
    assert_nothing_raised do
      run_generator(['UserSetting'])
    end
  end

  test 'fails with exception when name is not provided' do
    assert_raises ::Exception do
      run_generator([''])
    end
  end
end
