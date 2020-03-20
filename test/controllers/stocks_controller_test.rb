require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get stocks_url
    assert_response :redirect
  end

  test "should get new" do
    get new_stock_url
    assert_response :redirect
  end

  test "should show stock" do
    get stock_url(@stock)
    assert_response :redirect
  end

end
