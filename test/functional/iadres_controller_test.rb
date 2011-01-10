require 'test_helper'

class IadresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iadres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iadre" do
    assert_difference('Iadre.count') do
      post :create, :iadre => { }
    end

    assert_redirected_to iadre_path(assigns(:iadre))
  end

  test "should show iadre" do
    get :show, :id => iadres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => iadres(:one).to_param
    assert_response :success
  end

  test "should update iadre" do
    put :update, :id => iadres(:one).to_param, :iadre => { }
    assert_redirected_to iadre_path(assigns(:iadre))
  end

  test "should destroy iadre" do
    assert_difference('Iadre.count', -1) do
      delete :destroy, :id => iadres(:one).to_param
    end

    assert_redirected_to iadres_path
  end
end
