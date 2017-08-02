require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  include FactoryGirl::Syntax::Methods

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end

end

class ActionDispatch::IntegrationTest
  include ActiveModelSerializers::Test::Schema
  include ActiveModelSerializers::Test::Serializer
end