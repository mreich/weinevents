require 'test_helper'

class SitecitiesControllerTest < ActionController::TestCase
  setup do
    @sitecity = sitecities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sitecities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sitecity" do
    assert_difference('Sitecity.count') do
      post :create, sitecity: { name: @sitecity.name }
    end

    assert_redirected_to sitecity_path(assigns(:sitecity))
  end

  test "should show sitecity" do
    get :show, id: @sitecity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sitecity
    assert_response :success
  end

  test "should update sitecity" do
    put :update, id: @sitecity, sitecity: { name: @sitecity.name }
    assert_redirected_to sitecity_path(assigns(:sitecity))
  end

  test "should destroy sitecity" do
    assert_difference('Sitecity.count', -1) do
      delete :destroy, id: @sitecity
    end

    assert_redirected_to sitecities_path
  end
end
