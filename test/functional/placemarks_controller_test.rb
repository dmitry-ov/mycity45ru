require 'test_helper'

class PlacemarksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placemarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placemark" do
    assert_difference('Placemark.count') do
      post :create, :placemark => { }
    end

    assert_redirected_to placemark_path(assigns(:placemark))
  end

  test "should show placemark" do
    get :show, :id => placemarks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => placemarks(:one).to_param
    assert_response :success
  end

  test "should update placemark" do
    put :update, :id => placemarks(:one).to_param, :placemark => { }
    assert_redirected_to placemark_path(assigns(:placemark))
  end

  test "should destroy placemark" do
    assert_difference('Placemark.count', -1) do
      delete :destroy, :id => placemarks(:one).to_param
    end

    assert_redirected_to placemarks_path
  end
end
