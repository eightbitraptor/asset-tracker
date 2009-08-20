require 'test_helper'

class HardwareTypesControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create valid hardware type and redirect back to new hardware page" do
    post :create, :hardware_type => {:name => 'MacBook',:manufacturer => 'Apple', :model_number => '000'}
    assert_redirected_to new_hardware_path
    assert_equal 1, HardwareType.find(:all).count
  end
  
  test "should not allow creation of invalid hardware type" do
    post :create, :hardware_type => {}
    assert_template 'new'
    assert_equal "Could not Create Hardware Type", flash[:notice]
  end
end