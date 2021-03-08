require 'alpaca/trade/api'
require 'rest-client'

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
    @initial_invest = current_user.total_invested_amount.round(2)
    @current_value = current_user.total_invest_current_value.round(2)

    # performance

    @performance_in_percent = (((@current_value / @initial_invest) * 100) -100).round(2)
    @performance_in_eur = (@current_value - @initial_invest).round(2)
    
    # chart 
    @chart_data = Portfolio.last.chart_data
    @day_data = @chart_data[:day]
    @week_data = @chart_data[:week]
    @month_data = @chart_data[:month]
    @year_data = @chart_data[:year]

    # value per asset
  end

  def testcomponents
  end

    # value per industry



  # def test
  #   # @current_industry_value = 0

  #   # @assets.each do |asset|
  #   # asset.acquisitions.each do |acquisition|
  #   # asset.industry.name
  #   #   end
  #   # end
  # end





  def test
  end

  def chart_playground
    # client =  Alpaca::Trade::Api::Client.new
    # p client.account
    # url = 'https://paper-api.alpaca.markets/v2/account/portfolio/history'
    # headers = {
    #   "APCA-API-KEY-ID" => ENV['ALPACA_API_KEY_ID'],
    #   "APCA-API-SECRET-KEY" => ENV['ALPACA_API_SECRET_KEY'],
    #   'params' => { period: '2M', timeframe: '1D' }
    # }
    # result = RestClient::Request.execute(
    #   method: :get, url: url,
    #   headers: headers
    # )
    # data = JSON.parse(result.body)
    # @timestamp = data['timestamp']
    # @timestamp.map! { |time| Time.at(time).to_datetime.strftime('%d / %m / %y') }
    # @equity = data['equity']
    # p data['timestamp']
  end
end
