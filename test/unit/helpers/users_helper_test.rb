require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test "that gravatar address is generated successfully" do
    user = Factory(:user, :email =>'matt@theshadowaspect.com')
    email_hash = Digest::MD5.hexdigest(user.email)
    assert get_gravatar(user).include? "http://www.gravatar.com/avatar/#{email_hash}"
  end
end