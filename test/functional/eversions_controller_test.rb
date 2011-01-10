require 'test_helper'

class EversionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eversions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eversion" do
    assert_difference('Eversion.count') do
      post :create, :eversion => { }
    end

    assert_redirected_to eversion_path(assigns(:eversion))
  end

  test "should show eversion" do
    get :show, :id => eversions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => eversions(:one).to_param
    assert_response :success
  end

  test "should update eversion" do
    put :update, :id => eversions(:one).to_param, :eversion => { }
    assert_redirected_to eversion_path(assigns(:eversion))
  end

  test "should destroy eversion" do
    assert_difference('Eversion.count', -1) do
      delete :destroy, :id => eversions(:one).to_param
    end

    assert_redirected_to eversions_path
  end
end
