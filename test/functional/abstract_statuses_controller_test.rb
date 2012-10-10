require 'test_helper'

class AbstractStatusesControllerTest < ActionController::TestCase
  setup do
    @abstract_status = abstract_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:abstract_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abstract_status" do
    assert_difference('AbstractStatus.count') do
      post :create, abstract_status: { name: @abstract_status.name }
    end

    assert_redirected_to abstract_status_path(assigns(:abstract_status))
  end

  test "should show abstract_status" do
    get :show, id: @abstract_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abstract_status
    assert_response :success
  end

  test "should update abstract_status" do
    put :update, id: @abstract_status, abstract_status: { name: @abstract_status.name }
    assert_redirected_to abstract_status_path(assigns(:abstract_status))
  end

  test "should destroy abstract_status" do
    assert_difference('AbstractStatus.count', -1) do
      delete :destroy, id: @abstract_status
    end

    assert_redirected_to abstract_statuses_path
  end
end
