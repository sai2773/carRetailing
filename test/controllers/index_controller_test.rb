require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get checkout" do
    get :checkout
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
