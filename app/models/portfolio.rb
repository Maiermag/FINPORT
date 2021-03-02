class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :institution
  has_many :assets, dependent: :destroy
end
