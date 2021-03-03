class Asset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :industry
  has_many :acquisitions, dependent: :destroy
  has_many :past_pricings, dependent: :destroy
end
