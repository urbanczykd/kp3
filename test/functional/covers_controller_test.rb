require 'test_helper'

class CoversControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:covers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cover" do
    assert_difference('Cover.count') do
      post :create, :cover => { }
    end

    assert_redirected_to cover_path(assigns(:cover))
  end

  test "should show cover" do
    get :show, :id => covers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => covers(:one).to_param
    assert_response :success
  end

  test "should update cover" do
    put :update, :id => covers(:one).to_param, :cover => { }
    assert_redirected_to cover_path(assigns(:cover))
  end

  test "should destroy cover" do
    assert_difference('Cover.count', -1) do
      delete :destroy, :id => covers(:one).to_param
    end

    assert_redirected_to covers_path
  end
end
