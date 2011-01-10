require 'test_helper'

class ZgloszeniasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zgloszenias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zgloszenia" do
    assert_difference('Zgloszenia.count') do
      post :create, :zgloszenia => { }
    end

    assert_redirected_to zgloszenia_path(assigns(:zgloszenia))
  end

  test "should show zgloszenia" do
    get :show, :id => zgloszenias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => zgloszenias(:one).to_param
    assert_response :success
  end

  test "should update zgloszenia" do
    put :update, :id => zgloszenias(:one).to_param, :zgloszenia => { }
    assert_redirected_to zgloszenia_path(assigns(:zgloszenia))
  end

  test "should destroy zgloszenia" do
    assert_difference('Zgloszenia.count', -1) do
      delete :destroy, :id => zgloszenias(:one).to_param
    end

    assert_redirected_to zgloszenias_path
  end
end
