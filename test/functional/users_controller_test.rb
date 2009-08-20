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
    post 'create', :user => {:firstname => 'Matt', :surname => 'House'}
    assert_redirected_to users_path
    assert_equal 1, User.find(:all).count
  end
  
  test "should not create invalid user" do
    post 'create', :user => { :firstname => '', :surname => '' }
    assert_equal 0, User.find(:all).count
  end

  def test_edit
    user = Factory :user  
    get :edit, :id => user.id
    assert_template 'edit'
    assert_response :success
  end

  def test_update_invalid
    user = Factory :user  
    put :update, :id => user.id, :user => {:firstname => '', :surname => ''}
    user.reload
    assert_equal "Matthew", user.firstname
  end

  def test_update_valid
    user = Factory :user  
    put :update, :id => user.id, :user => {:firstname => 'Elizabeth', :surname => 'Valentine'}
    user.reload
    assert_equal "Elizabeth", user.firstname
  end

  test "should destroy user" do
    post 'create', :user => {:firstname => 'Matthew', :surname => 'House'}
    assert_equal 1, User.find(:all).count
    delete 'destroy', :id => User.last.id
    assert_equal 0, User.find(:all).count
  end
end
