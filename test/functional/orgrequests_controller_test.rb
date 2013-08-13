require 'test_helper'

class OrgrequestsControllerTest < ActionController::TestCase
  setup do
    @orgrequest = orgrequests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgrequests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgrequest" do
    assert_difference('Orgrequest.count') do
      post :create, orgrequest: { org_id: @orgrequest.org_id, status: @orgrequest.status, user_id: @orgrequest.user_id }
    end

    assert_redirected_to orgrequest_path(assigns(:orgrequest))
  end

  test "should show orgrequest" do
    get :show, id: @orgrequest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgrequest
    assert_response :success
  end

  test "should update orgrequest" do
    put :update, id: @orgrequest, orgrequest: { org_id: @orgrequest.org_id, status: @orgrequest.status, user_id: @orgrequest.user_id }
    assert_redirected_to orgrequest_path(assigns(:orgrequest))
  end

  test "should destroy orgrequest" do
    assert_difference('Orgrequest.count', -1) do
      delete :destroy, id: @orgrequest
    end

    assert_redirected_to orgrequests_path
  end
end
