require 'test_helper'

class ArchiwesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:archiwes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create archiwe" do
    assert_difference('Archiwe.count') do
      post :create, :archiwe => { }
    end

    assert_redirected_to archiwe_path(assigns(:archiwe))
  end

  test "should show archiwe" do
    get :show, :id => archiwes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => archiwes(:one).to_param
    assert_response :success
  end

  test "should update archiwe" do
    put :update, :id => archiwes(:one).to_param, :archiwe => { }
    assert_redirected_to archiwe_path(assigns(:archiwe))
  end

  test "should destroy archiwe" do
    assert_difference('Archiwe.count', -1) do
      delete :destroy, :id => archiwes(:one).to_param
    end

    assert_redirected_to archiwes_path
  end
end
