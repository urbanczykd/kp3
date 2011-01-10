require 'test_helper'

class EventdaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventday" do
    assert_difference('Eventday.count') do
      post :create, :eventday => { }
    end

    assert_redirected_to eventday_path(assigns(:eventday))
  end

  test "should show eventday" do
    get :show, :id => eventdays(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => eventdays(:one).to_param
    assert_response :success
  end

  test "should update eventday" do
    put :update, :id => eventdays(:one).to_param, :eventday => { }
    assert_redirected_to eventday_path(assigns(:eventday))
  end

  test "should destroy eventday" do
    assert_difference('Eventday.count', -1) do
      delete :destroy, :id => eventdays(:one).to_param
    end

    assert_redirected_to eventdays_path
  end
end
