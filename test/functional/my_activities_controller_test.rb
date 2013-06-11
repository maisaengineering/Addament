require 'test_helper'

class MyActivitiesControllerTest < ActionController::TestCase
  setup do
    @my_activity = my_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_activity" do
    assert_difference('MyActivity.count') do
      post :create, my_activity: { current_activity: @my_activity.current_activity }
    end

    assert_redirected_to my_activity_path(assigns(:my_activity))
  end

  test "should show my_activity" do
    get :show, id: @my_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_activity
    assert_response :success
  end

  test "should update my_activity" do
    put :update, id: @my_activity, my_activity: { current_activity: @my_activity.current_activity }
    assert_redirected_to my_activity_path(assigns(:my_activity))
  end

  test "should destroy my_activity" do
    assert_difference('MyActivity.count', -1) do
      delete :destroy, id: @my_activity
    end

    assert_redirected_to my_activities_path
  end
end
