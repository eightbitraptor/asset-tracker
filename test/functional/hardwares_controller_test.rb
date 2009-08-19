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
  end

  test "should create hardware" do
    assert_difference('Hardware.count') do
      post :create, :hardware => { }
    end

    assert_redirected_to hardware_path(assigns(:hardware))
  end

  test "should show hardware" do
    get :show, :id => hardwares(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => hardwares(:one).id
    assert_response :success
  end

  test "should update hardware" do
    put :update, :id => hardwares(:one).id, :hardware => { }
    assert_redirected_to hardware_path(assigns(:hardware))
  end

  test "should destroy hardware" do
    assert_difference('Hardware.count', -1) do
      delete :destroy, :id => hardwares(:one).id
    end

    assert_redirected_to hardwares_path
  end
end
