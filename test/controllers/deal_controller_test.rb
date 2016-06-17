require 'test_helper'

class DealControllerTest < ActionController::TestCase
  test "should get sell_main" do
    get :sell_main
    assert_response :success
  end

  test "should get buy_main" do
    get :buy_main
    assert_response :success
  end

end
