require 'test_helper'

class GoalCommentsControllerTest < ActionController::TestCase
  setup do
    @goal_comment = goal_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_comment" do
    assert_difference('GoalComment.count') do
      post :create, goal_comment: { comment_description: @goal_comment.comment_description, commenter_id: @goal_comment.commenter_id, goal_id: @goal_comment.goal_id }
    end

    assert_redirected_to goal_comment_path(assigns(:goal_comment))
  end

  test "should show goal_comment" do
    get :show, id: @goal_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_comment
    assert_response :success
  end

  test "should update goal_comment" do
    put :update, id: @goal_comment, goal_comment: { comment_description: @goal_comment.comment_description, commenter_id: @goal_comment.commenter_id, goal_id: @goal_comment.goal_id }
    assert_redirected_to goal_comment_path(assigns(:goal_comment))
  end

  test "should destroy goal_comment" do
    assert_difference('GoalComment.count', -1) do
      delete :destroy, id: @goal_comment
    end

    assert_redirected_to goal_comments_path
  end
end
