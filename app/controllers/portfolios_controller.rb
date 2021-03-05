class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @assets = @portfolio.assets
    @industries = @portfolio.industries

    # total initial invest for portfolio
    @invest = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        @invest += (acquisition.unit_price_bought * acquisition.units_bought)
        end
    end
    @invest = @invest.round(2)

    # current portfolio value
    @current_value = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        @current_value += (asset.current_unit_price * acquisition.units_bought)
      end
    end

    # current portfolio performance in % and eur
    @performance_percent = (((@current_value / @invest) * 100) - 100).round(2)
    @performance_eur = (@current_value - @invest).round(2)

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
