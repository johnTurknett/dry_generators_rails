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

  test 'generates tests' do
    path = Rails.root.join('test', 'dry', 'validators')
    test = Dir.entries path
    assert_includes(test, 'user_setting_validator_test.rb')
  end

  test 'generates specs' do
    path = Rails.root.join('spec', 'dry', 'validators')
    test = Dir.entries path
    assert_includes(test, 'user_setting_validator_spec.rb')
  end
end
