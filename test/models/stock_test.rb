require 'test_helper'

class StockTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "should not save stock without ticker" do
   	stock = Stock.new
  	assert_not stock.save
end

end
