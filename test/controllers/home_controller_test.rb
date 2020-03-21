require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get '/'
    assert_response :success
  end

  test "h1 element has the text 'NCI Stock App'" do
  	get '/'
  	assert_select "h1", "NCI Stock App"
  end 

  test "navigation to the about page" do
  	get "http://localhost:3000/home/about"
  	assert_response :success
  end

  test "navigation to the Register page" do
  	get "http://localhost:3000/users/sign_in"
  	assert_response :success
  end

  test "h2 element has the test'Welcome to the NCI Stock App  Here you can find all Company Tickers'" do 
    get "http://localhost:3000/home/about"
    assert_select "h2", "Welcome to the NCI Stock App  Here you can find all Company Tickers"
  end 

  test "h3 element has the text 'Companies Ticker List'" do
    get "http://localhost:3000/home/about"
    assert_select "h3", "Companies Ticker List"
  end 
end
