require 'test_helper'

class BookstorageTest < ActiveSupport::TestCase
  should belong_to :book
  should belong_to :bookstore
end
