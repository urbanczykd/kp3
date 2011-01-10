require 'test_helper'

class ToponesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topone" do
    assert_difference('Topone.count') do
      post :create, :topone => { }
    end

    assert_redirected_to topone_path(assigns(:topone))
  end

  test "should show topone" do
    get :show, :id => topones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => topones(:one).to_param
    assert_response :success
  end

  test "should update topone" do
    put :update, :id => topones(:one).to_param, :topone => { }
    assert_redirected_to topone_path(assigns(:topone))
  end

  test "should destroy topone" do
    assert_difference('Topone.count', -1) do
      delete :destroy, :id => topones(:one).to_param
    end

    assert_redirected_to topones_path
  end
end
