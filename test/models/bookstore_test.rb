require 'test_helper'

class BookstoreTest < ActiveSupport::TestCase
  should belong_to(:company).dependent(:destroy)
  should validate_presence_of :name 
end
