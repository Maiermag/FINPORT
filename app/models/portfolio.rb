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

  # def industry_names
  #   industries.pluck(:name).sort
  # end

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

end
