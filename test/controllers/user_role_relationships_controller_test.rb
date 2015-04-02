require 'test_helper'

class UserRoleRelationshipsControllerTest < ActionController::TestCase
  setup do
    @user_role_relationship = user_role_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_role_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_role_relationship" do
    assert_difference('UserRoleRelationship.count') do
      post :create, user_role_relationship: { role_id: @user_role_relationship.role_id, user_id: @user_role_relationship.user_id }
    end

    assert_redirected_to user_role_relationship_path(assigns(:user_role_relationship))
  end

  test "should show user_role_relationship" do
    get :show, id: @user_role_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_role_relationship
    assert_response :success
  end

  test "should update user_role_relationship" do
    patch :update, id: @user_role_relationship, user_role_relationship: { role_id: @user_role_relationship.role_id, user_id: @user_role_relationship.user_id }
    assert_redirected_to user_role_relationship_path(assigns(:user_role_relationship))
  end

  test "should destroy user_role_relationship" do
    assert_difference('UserRoleRelationship.count', -1) do
      delete :destroy, id: @user_role_relationship
    end

    assert_redirected_to user_role_relationships_path
  end
end
