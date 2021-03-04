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
    @portfolio = Portfolio.all
    @assets = Asset.all
    @acquisitions = Acquisition.all
    @industries = Industry.all.order(:name)

     # total initial invest

    @initial_invest = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        @initial_invest += (acquisition.unit_price_bought * acquisition.units_bought)
      end
    end
     @initial_invest = @initial_invest.round(2)

    # current total value

    @current_value = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        @current_value += (asset.current_unit_price * acquisition.units_bought)
      end
    end

    # performance

    @performance_in_percent = (((@current_value / @initial_invest) * 100) -100).round(2)
    @performance_in_eur = (@current_value - @initial_invest).round(2)

    # value per asset

    # value per industry

    @current_industry_value = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        asset.industry.name
        end
      end

    def test
    end

  end
end
