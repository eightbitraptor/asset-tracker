require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "creation of a valid user" do
    test_user = User.new
    assert test_user.save
  end
end
