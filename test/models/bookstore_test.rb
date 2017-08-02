require 'test_helper'

class BookstoreTest < ActiveSupport::TestCase
  should belong_to(:company).dependent(:destroy)
  should have_many :bookstorages
  should have_many(:books).through(:bookstorages)

  should validate_presence_of :name 
end
