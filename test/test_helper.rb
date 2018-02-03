require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest'
require "minitest/autorun"
require 'minitest/power_assert'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def auth_headers
    user = 'admin'
    pw = 'admin'
    {
      'HTTP_AUTHORIZATION' =>
      ActionController::HttpAuthentication::Basic.encode_credentials(user, pw)
    }
  end
end
