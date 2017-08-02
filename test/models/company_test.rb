require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  should have_many :bookstores
  should validate_presence_of :name
end
