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
    @week_data = []
    @month_data = []
    @year_data = []

    @portfolio.assets.first.past_pricings.order('date asc').each do |past_price|
      if @week_data.empty?
        @week_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif @week_data.last[:time].to_date <= past_price.date - 7.days
        @week_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      if @month_data.empty?
        @month_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif @month_data.last[:time].to_date <= past_price.date - 30.days
        @month_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      if @year_data.empty?
        @year_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif @year_data.last[:time].to_date <= past_price.date - 365.days
        @year_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      @day_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
    end

    @day_data = @day_data.first(150)
    @week_data = @week_data.first(150)
    @month_data = @month_data.first(150)
    @year_data = @year_data.first(15)

    # @day_data = JSON.generate(@day_data)

  end
end

