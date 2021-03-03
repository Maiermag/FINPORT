class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @assets = @portfolio.assets
  end

  def new
    @portfolio = Portfolio.new
  end

  def create

  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to portfolios_path, notice: 'portfolio removed from account'
  end

end
