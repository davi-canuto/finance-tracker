class StocksController < ApplicationController

  def search
    if params[:stock].present?
      stock_params = params[:stock]
      @stock = Stock.new_lookup(stock_params)
      if @stock
        render '/users/my_portifolio'
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portifolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portifolio_path
    end
  end

end