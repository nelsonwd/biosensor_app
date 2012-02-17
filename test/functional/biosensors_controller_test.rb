require 'test_helper'

class BiosensorsControllerTest < ActionController::TestCase
  setup do
    @biosensor = biosensors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:biosensors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create biosensor" do
    assert_difference('Biosensor.count') do
      post :create, :biosensor => @biosensor.attributes
    end

    assert_redirected_to biosensor_path(assigns(:biosensor))
  end

  test "should show biosensor" do
    get :show, :id => @biosensor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @biosensor.to_param
    assert_response :success
  end

  test "should update biosensor" do
    put :update, :id => @biosensor.to_param, :biosensor => @biosensor.attributes
    assert_redirected_to biosensor_path(assigns(:biosensor))
  end

  test "should destroy biosensor" do
    assert_difference('Biosensor.count', -1) do
      delete :destroy, :id => @biosensor.to_param
    end

    assert_redirected_to biosensors_path
  end
end
