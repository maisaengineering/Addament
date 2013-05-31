require 'test_helper'

class ProfessionalsControllerTest < ActionController::TestCase
  setup do
    @professional = professionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professional" do
    assert_difference('Professional.count') do
      post :create, professional: { achievements: @professional.achievements, affiliations: @professional.affiliations, aspriations: @professional.aspriations, company_name: @professional.company_name, description: @professional.description, end_date: @professional.end_date, location: @professional.location, professional_headline: @professional.professional_headline, project_description: @professional.project_description, project_end_date: @professional.project_end_date, project_name: @professional.project_name, project_start_date: @professional.project_start_date, role: @professional.role, start_date: @professional.start_date, title: @professional.title, user_id: @professional.user_id }
    end

    assert_redirected_to professional_path(assigns(:professional))
  end

  test "should show professional" do
    get :show, id: @professional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professional
    assert_response :success
  end

  test "should update professional" do
    put :update, id: @professional, professional: { achievements: @professional.achievements, affiliations: @professional.affiliations, aspriations: @professional.aspriations, company_name: @professional.company_name, description: @professional.description, end_date: @professional.end_date, location: @professional.location, professional_headline: @professional.professional_headline, project_description: @professional.project_description, project_end_date: @professional.project_end_date, project_name: @professional.project_name, project_start_date: @professional.project_start_date, role: @professional.role, start_date: @professional.start_date, title: @professional.title, user_id: @professional.user_id }
    assert_redirected_to professional_path(assigns(:professional))
  end

  test "should destroy professional" do
    assert_difference('Professional.count', -1) do
      delete :destroy, id: @professional
    end

    assert_redirected_to professionals_path
  end
end
