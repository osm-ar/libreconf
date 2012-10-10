require 'test_helper'

class SponsorTypesControllerTest < ActionController::TestCase
  setup do
    @sponsor_type = sponsor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor_type" do
    assert_difference('SponsorType.count') do
      post :create, sponsor_type: { name: @sponsor_type.name }
    end

    assert_redirected_to sponsor_type_path(assigns(:sponsor_type))
  end

  test "should show sponsor_type" do
    get :show, id: @sponsor_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor_type
    assert_response :success
  end

  test "should update sponsor_type" do
    put :update, id: @sponsor_type, sponsor_type: { name: @sponsor_type.name }
    assert_redirected_to sponsor_type_path(assigns(:sponsor_type))
  end

  test "should destroy sponsor_type" do
    assert_difference('SponsorType.count', -1) do
      delete :destroy, id: @sponsor_type
    end

    assert_redirected_to sponsor_types_path
  end
end
