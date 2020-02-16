require 'test_helper'
require 'generators/dry/monad/monad_generator'

class Dry::Generators::MonadGeneratorTest < Rails::Generators::TestCase
  tests Dry::Generators::MonadGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  test 'runs successfully when name is provided' do
    assert_nothing_raised do
      run_generator(['CreateUser'])
    end
  end

  test 'fails with exception when name is not provided' do
    assert_raises ::Exception do
      run_generator([''])
    end
  end

  test 'generates tests' do
    path = Rails.root.join('test', 'dry', 'monads')
    test = Dir.entries path
    assert_includes(test, 'create_user_test.rb')
  end

  test 'generates specs' do
    path = Rails.root.join('spec', 'dry', 'monads')
    test = Dir.entries path
    assert_includes(test, 'create_user_spec.rb')
  end
end
