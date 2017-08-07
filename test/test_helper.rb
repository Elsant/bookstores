require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    include FactoryGirl::Syntax::Methods

    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :minitest
        with.library :rails
      end
    end
  end
end

module ActionDispatch
  class IntegrationTest
    include ActiveModelSerializers::Test::Schema
    include ActiveModelSerializers::Test::Serializer
  end
end
