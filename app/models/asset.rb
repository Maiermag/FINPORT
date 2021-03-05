class Asset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :industry
  has_many :acquisitions, dependent: :destroy
  has_many :past_pricings, dependent: :destroy

  def total_units_bought
    acquisitions.sum(:units_bought)
  end

  def total_current_value
    total_units_bought * current_unit_price
  end

  #per asset:
  def total_invested_value
    acquisitions.sum do |acquisition|
       acquisition.unit_price_bought * acquisition.units_bought
    end
  end
end
