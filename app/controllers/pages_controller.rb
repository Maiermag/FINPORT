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
    @portfolio = Portfolio.all
    @assets = Asset.all
    @acquisitions = Acquisition.all
    @industries = Industry.all.order(:name)
  end

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

    @portfolio = Portfolio.last
    @total_units_invested = 0
    @total_value_invested = 0
    @portfolio.assets.each do |asset|
      asset.acquisitions.each do |acquisition|
        @total_units_invested += acquisition.units_bought
        @total_value_invested += (acquisition.units_bought * acquisition.unit_price_bought)
      end
    end
    @day_data = []
    @portfolio.assets.first.past_pricings.first(150).each do |past_price|
      @day_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
    end
    @day_data = JSON.generate(@day_data)
  end
end
