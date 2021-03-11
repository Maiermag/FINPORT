class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :portfolios, dependent: :destroy
  has_many :assets, through: :portfolios
  has_many :industries, -> { distinct }, through: :portfolios

  def total_invested_amount
    assets.sum do |asset|
      asset.total_invested_value
    end
  end

  def total_invest_current_value
    assets.sum do |asset|
      asset.total_current_value
    end
  end

  def total_asset_value_on_date(date)
    assets.includes(:past_pricings).sum { |asset| asset.value_at_date(date) }
  end

  def chart_data
    dates = PastPricing.all_dates

    # year data
    year_dates = dates.last(ENV["QUARTER_INTERVAL_DAYS"].to_i)
    year_data = year_dates.map do |date|
      { time: date, value: total_asset_value_on_date(date) }
    end

    # month data
    month_data = year_data.last(30)
    # week data
    week_data = month_data.last(7)

    {
      day: [],
      week: week_data,
      month: month_data,
      year: year_data
    }
  end

  def asset_names
    assets.pluck(:asset_name).sort
  end

  # array of hashes:
  def assets_by_name(sort_key = :portfolio_share)
    hashes = asset_names.uniq.map do |asset_name|
      current_value = total_current_specific_asset_value(asset_name)
      {
        name: asset_name,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_invest_current_value) * 100),
        performance: (((current_value / total_invested_asset_value(asset_name)) * 100) - 100)
      }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  def industry_names
    industries.pluck(:name)
  end

  def industries_by_name(sort_key = :portfolio_share)
  hashes = industries.uniq.map do |industry|
    current_value = total_current_asset_value(industry)
    {
      name: industry.name.capitalize,
      portfolio_value: current_value,
      portfolio_share: ((current_value / total_invest_current_value) * 100),
    }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  def categories_by_name(sort_key = :portfolio_share)
  hashes = asset_categories.uniq.map do |asset_category|
    current_value = total_category_current_value(asset_category)
    {
      name: asset_category == 'ETF' ? asset_category : asset_category.capitalize,
      portfolio_value: current_value,
      portfolio_share: ((current_value / total_invest_current_value) * 100),
    }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  def total_current_asset_value(industry)
    portfolios.sum do |portfolio|
      portfolio.total_current_asset_value(industry)
    end
  end

  def total_current_specific_asset_value(asset_name)
    assets.where(asset_name: asset_name).sum do |asset|
      asset.total_current_value
    end
  end

  def total_invested_asset_value(asset_name)
    assets.where(asset_name: asset_name).sum do |asset|
      asset.total_invested_value
    end
  end

  def asset_categories
    assets.pluck(:asset_category).sort
  end

  def total_category_current_value(asset_category)
    assets.where(asset_category: asset_category).sum do |asset|
      asset.total_current_value
    end
  end

end
