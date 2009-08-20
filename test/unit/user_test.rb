require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "creation of a valid user" do
    User.any_instance.stubs(:valid?).returns(true)
    assert User.new.save
  end
  
  test "that creation of an invalid user fails" do
    User.any_instance.stubs(:valid?).returns(false)
    assert_equal false, User.new.save
  end
  
  test "that user has left when left_on is not nil" do
    user = Factory(:left_user)
    assert user.left_yet?.include? "left reevoo on"
  end
  
  test "that user hasn't left when left_on is nil" do
    user = Factory(:user)
    assert user.left_yet?.include? "is still working here"
  end
  
  test "that name is displayed nicely" do
    user = Factory(:user)
    assert user.nice_name == "#{user.firstname} #{user.surname}"
  end
end

class UsersHelperTest < ActionView::TestCase
  test "that gravatar address is generated successfully" do
    user = Factory(:user, :email =>'matt@theshadowaspect.com')
    email_hash = Digest::MD5.hexdigest(user.email)
    assert get_gravatar(user).include? "http://www.gravatar.com/avatar/#{email_hash}"
  end
end

