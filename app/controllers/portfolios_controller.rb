class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @assets = @portfolio.assets
  end


  def create
    @institution = Institution.find(params[:portfolio][:institution_id])
    @portfolio = Portfolio.find_by(institution: @institution, user_id: nil) # found the empty portfolio
    @portfolio.user = current_user
    if @portfolio.save
      redirect_to portfolio_path(@portfolio), notice: '🙌 portfolio successfully added'
    else
      redirect_to institutions_path, notice: '☝️ portfolio could not be created'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    redirect_to portfolios_path, notice: '👍 portfolio removed from account'
  end

end
