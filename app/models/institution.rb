class Institution < ApplicationRecord
  has_many :portfolios, dependent: :destroy
end
