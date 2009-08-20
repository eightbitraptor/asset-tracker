require 'test_helper'

class SoftwaresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create valid software" do
    post :create, :software => {:name => 'office', :date_purchased => Time.now}
    assert_redirected_to softwares_path
    assert_equal 1, Software.find(:all).count
  end
  
  test "should not create invalid software" do
    post :create , :software => {:name => '', :date_purchased => ''}
    assert_equal 0, Software.find(:all).count
  end

  def test_edit
    software = Factory :software  
    get :edit, :id => software.id
    assert_template 'edit'
    assert_response :success
  end

  def test_update_invalid
    software = Factory :software  
    put :update, :id => software.id, :software => {:name => '', :date_purchased => Time.now}
    software.reload
    assert_equal "Microsoft Windows XP", software.name
  end

  def test_update_valid
    software = Factory :software  
    put :update, :id => software.id, :software => {:name => 'blahblah', :date_purchased => Time.now}
    software.reload
    assert_equal "blahblah", software.name
  end

  test "should destroy software" do
    post :create, :software => {:name => 'office', :date_purchased => Time.now}
    assert_equal 1, Software.find(:all).count
    delete :destroy, :id => Software.last.id
    assert_equal 0, Software.find(:all).count
  end
end
