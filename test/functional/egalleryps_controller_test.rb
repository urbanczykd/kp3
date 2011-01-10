require 'test_helper'

class EgallerypsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egalleryps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egalleryp" do
    assert_difference('Egalleryp.count') do
      post :create, :egalleryp => { }
    end

    assert_redirected_to egalleryp_path(assigns(:egalleryp))
  end

  test "should show egalleryp" do
    get :show, :id => egalleryps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => egalleryps(:one).to_param
    assert_response :success
  end

  test "should update egalleryp" do
    put :update, :id => egalleryps(:one).to_param, :egalleryp => { }
    assert_redirected_to egalleryp_path(assigns(:egalleryp))
  end

  test "should destroy egalleryp" do
    assert_difference('Egalleryp.count', -1) do
      delete :destroy, :id => egalleryps(:one).to_param
    end

    assert_redirected_to egalleryps_path
  end
end
