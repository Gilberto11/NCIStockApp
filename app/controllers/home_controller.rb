class HomeController < ApplicationController
  def index
  	#api key required in every controller for rendering the stock data
  	@api = StockQuote::Stock.new(api_key:'pk_ed3bf1990f8a4bdcaa33dc9a9f725a7c')
  	#error handling in case the lookup button is pressed without any value in the "ticker" field
  	if params[:ticker] == ""
  		@empty = "You must enter a company symbol!"
  	#if stamement for error handling as ticker is was not defined so if the form is filled user woul get an error
  	elsif params[:ticker]
  		#mapping the stock result to be based on the user input in the field we called ticker
  		@stock = StockQuote::Stock.quote(params[:ticker]) 
  	end

  end

  def about
  end
end
