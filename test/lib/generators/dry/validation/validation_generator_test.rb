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

  test 'params are a string and optional by default' do
    run_generator(['UserWithOptionalEmailString', '--params', 'email'])
    content = File.read(File.join(
      Dry::Generators::Base::VALIDATIONS_PATH,
      'user_with_optional_email_string.rb'
    ))
    assert_match /optional\(:email\).value\(:string\)/, content
  end

  test 'params can be defined with a type and be required' do
    run_generator(['UserWithRequiredAgeAndOptionalEmail', '--params', 'age:integer:required', 'email'])
    content = File.read(File.join(
      Dry::Generators::Base::VALIDATIONS_PATH,
      'user_with_required_age_and_optional_email.rb'
    ))
    assert_match /optional\(:email\).value\(:string\)/, content
    assert_match /required\(:age\).value\(:integer\)/, content
  end

  test 'generates tests' do
    path = Rails.root.join('test', 'dry', 'validations')
    test = Dir.entries path
    assert_includes(test, 'user_setting_test.rb')
  end

  test 'generates specs' do
    path = Rails.root.join('spec', 'dry', 'validations')
    test = Dir.entries path
    assert_includes(test, 'user_setting_spec.rb')
  end
end
