require 'test_helper'

class OrganizationsProfessionalsControllerTest < ActionController::TestCase
  setup do
    @organizations_professional = organizations_professionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations_professionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizations_professional" do
    assert_difference('OrganizationsProfessional.count') do
      post :create, organizations_professional: {  }
    end

    assert_redirected_to organizations_professional_path(assigns(:organizations_professional))
  end

  test "should show organizations_professional" do
    get :show, id: @organizations_professional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizations_professional
    assert_response :success
  end

  test "should update organizations_professional" do
    put :update, id: @organizations_professional, organizations_professional: {  }
    assert_redirected_to organizations_professional_path(assigns(:organizations_professional))
  end

  test "should destroy organizations_professional" do
    assert_difference('OrganizationsProfessional.count', -1) do
      delete :destroy, id: @organizations_professional
    end

    assert_redirected_to organizations_professionals_path
  end
end
