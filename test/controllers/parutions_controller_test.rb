require 'test_helper'

class ParutionsControllerTest < ActionController::TestCase
  setup do
    @parution = parutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parution" do
    assert_difference('Parution.count') do
      post :create, parution: { desc: @parution.desc, title: @parution.title }
    end

    assert_redirected_to parution_path(assigns(:parution))
  end

  test "should show parution" do
    get :show, id: @parution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parution
    assert_response :success
  end

  test "should update parution" do
    patch :update, id: @parution, parution: { desc: @parution.desc, title: @parution.title }
    assert_redirected_to parution_path(assigns(:parution))
  end

  test "should destroy parution" do
    assert_difference('Parution.count', -1) do
      delete :destroy, id: @parution
    end

    assert_redirected_to parutions_path
  end
end
