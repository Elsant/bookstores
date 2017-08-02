require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should belong_to :publisher
  should validate_presence_of :title
end
