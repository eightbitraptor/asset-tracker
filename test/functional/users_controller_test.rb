require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create valid user" do
    usercount = User.find(:all).count
    User.any_instance.stubs(:valid?).returns(true)
    post 'create'
    assert_redirected_to users_path
    assert_equal User.find(:all).count, usercount +1
  end
  
  test "should not create invalid user" do
    usercount = User.find(:all).count
    User.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assert_response :success
    assert_equal User.find(:all).count, usercount
  end

  def test_edit
    post(:create, :user => { :surname => 'House', :firstname => 'Matthew'})
    get :edit, :id => User.first
    assert_template 'edit'
    assert_response :success
  end

  def test_update_invalid
    User.create( :firstname => 'Matthew', :surname => 'House')
    testuser = User.first
    testuser.firstname=''
    put :update, :id => testuser
    assert flash[:notice].include? "Firstname can't be blank"
  end

  def test_update_valid
    User.create( :firstname => 'Matthew', :surname => 'House')
    new_params = {:firstname => 'Elizabeth', :surname => 'Valentine'}
    put :update, :id => User.first, :params => new_params
    assert_not_nil User.find_by_firstname('Elizabeth')
    assert_nil User.find_by_firstname('Matthew')
  end

  test "should destroy user" do
    User.any_instance.stubs(:valid?).returns(true)
    post 'create'
    usercount = User.find(:all).count
    delete 'destroy', :id => User.last.id
    assert_equal User.find(:all).count, usercount -1
    #get the count of users
    #destroy a user
    #ensure that count is -=1
  end
end
