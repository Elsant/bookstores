require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
end
