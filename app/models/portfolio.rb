class Portfolio < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :institution
  has_many :assets, dependent: :destroy
  has_many :industries, -> { distinct }, through: :assets

  def total_current_asset_value(industry)
    assets.where(industry: industry).sum do |asset|
      asset.total_current_value
    end
  end

  def total_current_specific_asset_value(asset_name)
    assets.where(asset_name: asset_name).sum do |asset|
      asset.total_current_value
    end
  end

  def total_initial_specific_asset_value(asset_name)
    assets.where(asset_name: asset_name).sum do |asset|
      asset.total_invested_value
    end
  end

  def total_current_category_value(asset_category)
    assets.where(asset_category: asset_category).sum do |asset|
      asset.total_current_value
    end
  end

  def total_initial_category_value(asset_category)
    assets.where(asset_category: asset_category).sum do |asset|
      asset.total_invested_value
    end
  end

  def asset_categories
     assets.pluck(:asset_category).sort
  end


  def total_current_industry_value(industry)
    assets.where(industry: industry).sum do |asset|
      asset.total_current_value
    end
  end

  def total_initial_industry_value(industry)
    assets.where(industry: industry).sum do |asset|
      asset.total_invested_value
    end
  end

  def total_current_portfolio_value
    assets.sum do |asset|
      asset.total_current_value
    end
  end

  def total_units_invested
    assets.sum do |asset|
      asset.total_units_bought
    end
  end

  def asset_names
     assets.pluck(:asset_name)
  end

  def assets_by_name(sort_key = :portfolio_share)
    hashes = asset_names.uniq.map do |asset_name|
      current_value = total_current_specific_asset_value(asset_name)
      {
        name: asset_name,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_current_portfolio_value) * 100),
        performance: (((total_current_specific_asset_value(asset_name) / total_initial_specific_asset_value(asset_name)) * 100) - 100)
      }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  def industries_by_name(sort_key = :portfolio_share)
    hashes = industries.uniq.map do |industry|
      current_value = total_current_asset_value(industry)
      {
        name: industry.name.capitalize,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_current_portfolio_value) * 100),
      }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  def categories_by_name(sort_key = :portfolio_share)
    hashes = asset_categories.uniq.map do |asset_category|
      current_value = total_current_category_value(asset_category)
      {
        name: asset_category.capitalize,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_current_portfolio_value) * 100),
      }
    end
    hashes.sort { |a, b| b[sort_key] <=> a[sort_key] }
  end

  def chart_data
    
    day_data = []
    week_data = []
    month_data = []
    year_data = []

    assets.first.past_pricings.order('date asc').each do |past_price|
      if week_data.empty?
        week_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif week_data.last[:time].to_date <= past_price.date - 7.days
        week_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      if month_data.empty?
        month_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif month_data.last[:time].to_date <= past_price.date - 30.days
        month_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      if year_data.empty?
        year_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      elsif year_data.last[:time].to_date <= past_price.date - 30.days
        year_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
      end

      day_data << { time: past_price.date.strftime('%Y-%m-%d'), value: past_price.unit_price }
    end

    day_data = day_data.first(150)
    week_data = week_data.first(150)
    month_data = month_data.first(150)
    year_data = year_data.first(15)

    {
      day: day_data,
      week: week_data,
      month: month_data,
      year: year_data
    }
  end

end
