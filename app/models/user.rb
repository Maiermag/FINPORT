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

  def asset_names
    assets.pluck(:asset_name).sort
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
