class PastPricing < ApplicationRecord
  belongs_to :asset

  def self.all_dates
    order(:date).pluck(:date).map { |d| d.strftime('%Y-%m-%d')}.uniq
  end
end
