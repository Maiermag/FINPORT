class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @assets = @portfolio.assets
    # = an array of assets
  end
end
