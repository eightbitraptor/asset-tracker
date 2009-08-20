require 'test_helper'

class HardwaresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hardwares)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create valid hardware" do
    post :create, :hardware => {:serial_number => 'office', :date_purchased => Time.now}
    assert_redirected_to hardwares_path
    assert_equal 1, Hardware.find(:all).count
  end
  
  test "should not create invalid hardware" do
    post :create , :hardware => {:serial_number => '', :date_purchased => ''}
    assert_equal 0, Hardware.find(:all).count
  end

  test "the edit template" do
    hardware = Factory :hardware  
    get :edit, :id => hardware.id
    assert_template 'edit'
    assert_response :success
  end

  test "updating to an invalid object" do
    hardware = Factory :hardware  
    put :update, :id => hardware.id, :hardware => {:serial_number => '', :date_purchased => Time.now}
    hardware.reload
    assert_equal "0123456789", hardware.serial_number
  end

  test "updating a valid object" do
    hardware = Factory :hardware  
    put :update, :id => hardware.id, :hardware => {:serial_number => 'blahblah', :date_purchased => Time.now}
    hardware.reload
    assert_equal "blahblah", hardware.serial_number
  end

  test "should destroy hardware" do
    post :create, :hardware => {:serial_number => 'office', :date_purchased => Time.now}
    assert_equal 1, Hardware.find(:all).count
    delete :destroy, :id => Hardware.last.id
    assert_equal 0, Hardware.find(:all).count
  end
end
