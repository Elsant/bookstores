require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should belong_to :publisher
  should have_many :bookstorages
  should have_many(:bookstores).through(:bookstorages)

  should validate_presence_of :title
end
