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

end
