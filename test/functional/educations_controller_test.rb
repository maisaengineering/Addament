require 'test_helper'

class EducationsControllerTest < ActionController::TestCase
  setup do
    @education = educations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:educations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create education" do
    assert_difference('Education.count') do
      post :create, education: { activities_and_societies: @education.activities_and_societies, date_attended: @education.date_attended, degree: @education.degree, description: @education.description, field_of_study: @education.field_of_study, grade: @education.grade, school: @education.school, skills: @education.skills }
    end

    assert_redirected_to education_path(assigns(:education))
  end

  test "should show education" do
    get :show, id: @education
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education
    assert_response :success
  end

  test "should update education" do
    put :update, id: @education, education: { activities_and_societies: @education.activities_and_societies, date_attended: @education.date_attended, degree: @education.degree, description: @education.description, field_of_study: @education.field_of_study, grade: @education.grade, school: @education.school, skills: @education.skills }
    assert_redirected_to education_path(assigns(:education))
  end

  test "should destroy education" do
    assert_difference('Education.count', -1) do
      delete :destroy, id: @education
    end

    assert_redirected_to educations_path
  end
end
