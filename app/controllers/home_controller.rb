class HomeController < ApplicationController
  def index
  	@api = StockQuote::Stock.new(api_key:'pk_ed3bf1990f8a4bdcaa33dc9a9f725a7c')
  end

  def about
  end
end
