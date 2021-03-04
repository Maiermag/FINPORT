class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def portfolio_import
    @portfolio = Portfolio.find(params[:id])
    @etf_assets = @portfolio.assets.where(asset_category: "ETF")
    @share_assets = @portfolio.assets.where(asset_category: "share")
    @crypto_assets = @portfolio.assets.where(asset_category: "cryptocurrency")
  end

  def dashboard
    @portfolios = Portfolio.all
    @assets = Asset.all
    @acquisitions = Acquisition.all
    @industries = current_user.industries.order(:name)

    # total initial invest

    @initial_invest = current_user.total_invested_amount.round(2)

    # current total value

    @current_value = current_user.total_invest_current_value.round(2)

    # performance

    @performance_in_percent = (((@current_value / @initial_invest) * 100) -100).round(2)
    @performance_in_eur = (@current_value - @initial_invest).round(2)

    # value per industry

    @current_industry_value = 0



    # all assets in the users existing industries
    # units bought per asset
    # current price per asset
    # take the sum of all these assets

    # @industry.assets do |asset|
    #   asset.acquisitions.each do |acquisition|
    #     @current_value += (asset.current_unit_price * acquisition.units_bought)
    #   end
    # end

    # @assets.each do |asset|
    #   asset.acquisitions.each do |acquisition|
    #     asset.industry.name
    #   end
    # end

  end

  def test
  end
end
