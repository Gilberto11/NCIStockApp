require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(email: 'gilbertocaobiancojunior@gmail.com')
	end

	test 'invalid without email' do
	user = User.new(email:'gilbertocaobiancojunior@gmail.com')
	refute user.valid?
	assert_not_nil user.errors[:email] 	
	end

end
