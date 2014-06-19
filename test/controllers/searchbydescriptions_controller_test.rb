require 'test_helper'

class SearchbydescriptionsControllerTest < ActionController::TestCase
  setup do
    @searchbydescription = searchbydescriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:searchbydescriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create searchbydescription" do
    assert_difference('Searchbydescription.count') do
      post :create, searchbydescription: {  }
    end

    assert_redirected_to searchbydescription_path(assigns(:searchbydescription))
  end

  test "should show searchbydescription" do
    get :show, id: @searchbydescription
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @searchbydescription
    assert_response :success
  end

  test "should update searchbydescription" do
    patch :update, id: @searchbydescription, searchbydescription: {  }
    assert_redirected_to searchbydescription_path(assigns(:searchbydescription))
  end

  test "should destroy searchbydescription" do
    assert_difference('Searchbydescription.count', -1) do
      delete :destroy, id: @searchbydescription
    end

    assert_redirected_to searchbydescriptions_path
  end
end
