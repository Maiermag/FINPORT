class Asset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :industry
  has_many :acquisitions, dependent: :destroy
  has_many :past_pricings, dependent: :destroy

  def total_units_bought
    acquisitions.sum(:units_bought)
  end

  def total_current_value
    current_pricing = past_pricings.order(date: :desc).first.unit_price
    total_units_bought * current_pricing
    # current_unit_price
  end

  #per asset:
  def total_invested_value
    acquisitions.sum do |acquisition|
      acquisition.unit_price_bought * acquisition.units_bought
    end
  end

  def value_at_date(date)
    past_pricing = past_pricings.where("date_trunc('day', date)::date = ?", date).first
    # past_pricing = past_pricings.find_by(date: date)

    price = past_pricing.nil? ? 0 : past_pricing.unit_price
    total_units_bought * price
  end
end
