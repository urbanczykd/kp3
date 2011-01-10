require 'test_helper'

class EgalleriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egalleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create egallery" do
    assert_difference('Egallery.count') do
      post :create, :egallery => { }
    end

    assert_redirected_to egallery_path(assigns(:egallery))
  end

  test "should show egallery" do
    get :show, :id => egalleries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => egalleries(:one).to_param
    assert_response :success
  end

  test "should update egallery" do
    put :update, :id => egalleries(:one).to_param, :egallery => { }
    assert_redirected_to egallery_path(assigns(:egallery))
  end

  test "should destroy egallery" do
    assert_difference('Egallery.count', -1) do
      delete :destroy, :id => egalleries(:one).to_param
    end

    assert_redirected_to egalleries_path
  end
end
