class Asset < ApplicationRecord
  belongs_to :portfolio
  has_many :acquisitions, dependent: :destroy
  has_many :past_pricings, dependent: :destroy
end
