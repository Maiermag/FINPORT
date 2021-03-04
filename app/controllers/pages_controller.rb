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

    initial_invest = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        initial_invest += (acquisition.unit_price_bought * acquisition.units_bought)
      end
    end
    return initial_invest

    # current total value

    current_value = 0
    @assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        current_value += (asset.current_unit_price * acquisition.units_bought)
      end
    end
    return current_value

    # performance

    performance_in_percent = (((current_value / invest) * 100) -100)
    return performance_in_percent.round(2)
    performance_in_eur = current_value - invest

    # value per asset

    def test
    end

  end
end
