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

  def asset_names
     assets.pluck(:asset_name)
  end

  # array of hashes:
  def assets_by_name(sort_key = :portfolio_share)
    hashes = asset_names.uniq.map do |asset_name|
      current_value = total_current_specific_asset_value(asset_name)
      {
        name: asset_name,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_current_portfolio_value) * 100),
        performance: (((total_current_specific_asset_value(asset_name)/ total_initial_specific_asset_value(asset_name)) * 100) - 100)
      }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

  # def industry_names
  #    industries.pluck(:name)
  # end

    # array of hashes:
  def industries_by_name(sort_key = :portfolio_share)
    hashes = industries.uniq.map do |industry|
      current_value = total_current_asset_value(industry)
      {
        name: industry.name,
        portfolio_value: current_value,
        portfolio_share: ((current_value / total_current_portfolio_value) * 100),
        performance: (((total_current_specific_asset_value(asset_name)/ total_initial_specific_asset_value(asset_name)) * 100) - 100)
      }
    end
    hashes.sort{ |a,b| b[sort_key] <=> a[sort_key]}
  end

end
