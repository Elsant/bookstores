require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
