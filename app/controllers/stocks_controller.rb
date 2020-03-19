class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  #creating a before action to set the stock to show only to the correct user, without this users can see each other stocks
  before_action :correct_user, only: [:edit, :update, :destroy]#only the correct user can edit,update and delete
  before_action :authenticate_user!

  # GET /stocks
  # GET /stocks.json
  def index
    @api = StockQuote::Stock.new(api_key:'pk_ed3bf1990f8a4bdcaa33dc9a9f725a7c')
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully deleted.' }
      format.json { head :no_content }
    end
  end
 #creating a method to define the correct_user that is been called on the top of this file
  def correct_user
    #setting ticker to be the current user and find which stock belongs to the user based on the user id
    @ticker = current_user.stocks.find_by(id: params[:id])
    #if the ticker does not match with the user id then display the message below
    redirect_to stocks_path, notice: "This user is not authorized to edit this stock" if @ticker.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:ticker, :user_id)
    end
end
