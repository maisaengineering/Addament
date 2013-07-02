require 'test_helper'

class RequesttomentorsControllerTest < ActionController::TestCase
  setup do
    @requesttomentor = requesttomentors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requesttomentors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requesttomentor" do
    assert_difference('Requesttomentor.count') do
      post :create, requesttomentor: { following_id: @requesttomentor.following_id, status: @requesttomentor.status, user_id: @requesttomentor.user_id }
    end

    assert_redirected_to requesttomentor_path(assigns(:requesttomentor))
  end

  test "should show requesttomentor" do
    get :show, id: @requesttomentor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requesttomentor
    assert_response :success
  end

  test "should update requesttomentor" do
    put :update, id: @requesttomentor, requesttomentor: { following_id: @requesttomentor.following_id, status: @requesttomentor.status, user_id: @requesttomentor.user_id }
    assert_redirected_to requesttomentor_path(assigns(:requesttomentor))
  end

  test "should destroy requesttomentor" do
    assert_difference('Requesttomentor.count', -1) do
      delete :destroy, id: @requesttomentor
    end

    assert_redirected_to requesttomentors_path
  end
end
