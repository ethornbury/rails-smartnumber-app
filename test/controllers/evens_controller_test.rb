require 'test_helper'

class EvensControllerTest < ActionController::TestCase
  setup do
    @even = evens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create even" do
    assert_difference('Even.count') do
      post :create, even: { number: @even.number }
    end

    assert_redirected_to even_path(assigns(:even))
  end

  test "should show even" do
    get :show, id: @even
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @even
    assert_response :success
  end

  test "should update even" do
    patch :update, id: @even, even: { number: @even.number }
    assert_redirected_to even_path(assigns(:even))
  end

  test "should destroy even" do
    assert_difference('Even.count', -1) do
      delete :destroy, id: @even
    end

    assert_redirected_to evens_path
  end
end
