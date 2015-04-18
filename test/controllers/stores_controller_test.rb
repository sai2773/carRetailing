require 'test_helper'

class StoresControllerTest < ActionController::TestCase
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post :create, store: { color: @store.color, description: @store.description, feature1: @store.feature1, feature2: @store.feature2, feature3: @store.feature3, feature4: @store.feature4, make: @store.make, model: @store.model, name: @store.name, price: @store.price, year: @store.year }
    end

    assert_redirected_to store_path(assigns(:store))
  end

  test "should show store" do
    get :show, id: @store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store
    assert_response :success
  end

  test "should update store" do
    patch :update, id: @store, store: { color: @store.color, description: @store.description, feature1: @store.feature1, feature2: @store.feature2, feature3: @store.feature3, feature4: @store.feature4, make: @store.make, model: @store.model, name: @store.name, price: @store.price, year: @store.year }
    assert_redirected_to store_path(assigns(:store))
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete :destroy, id: @store
    end

    assert_redirected_to stores_path
  end
end
