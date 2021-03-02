class Asset < ApplicationRecord
  belongs_to :portfolio
  has_many :acquisitions
  has_many :past_pricings
end
