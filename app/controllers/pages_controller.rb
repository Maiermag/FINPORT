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
end
