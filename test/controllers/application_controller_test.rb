require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  should rescue_from(ActiveRecord::RecordNotFound).with(:respond_with_not_found)
end