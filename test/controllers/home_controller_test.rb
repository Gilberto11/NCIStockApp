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


end
