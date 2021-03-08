# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

User.destroy_all
Institution.destroy_all
Portfolio.destroy_all
Asset.destroy_all
Industry.destroy_all
Acquisition.destroy_all
PastPricing.destroy_all

#industries seed

industries = {}

["food", "automotive", "cryptocurrency", "energy"].each do |name|
  industry = Industry.create!(name: name)
  industries[name]=industry
end



#institutions seed

institution2 = Institution.create!(name: "Scalable Capital")
institution3 = Institution.create!(name: "Sparkasse")
institution4 = Institution.create!(name: "Bitpanda")
institution5 = Institution.create!(name: "Deutsche Bank")
institution6 = Institution.create!(name: "Coinbase")
institution7 = Institution.create!(name: "N26")
institution8 = Institution.create!(name: "Revolut")
institution9 = Institution.create!(name: "Flatex")
institution10 = Institution.create!(name: "ING-DiBa")
institution11 = Institution.create!(name: "Volksbank")
institution12 = Institution.create!(name: "Commerzbank")
institution13 = Institution.create!(name: "Bison")
institution14 = Institution.create!(name: "Postbank")
institution15 = Institution.create!(name: "Targo Bank")
institution16 = Institution.create!(name: "etoro")
institution17 = Institution.create!(name: "smartbroker")
institution18 = Institution.create!(name: "onvista-bank")
institution19 = Institution.create!(name: "sbroker")
institution20 = Institution.create!(name: "Oskar")
institution21 = Institution.create!(name: "Faker")

# first seed with Trade Republic
user1 = User.create!(first_name: "Jonas", last_name: "Mikael", email: "jonas@example.com", password: "123456")
institution1 = Institution.create!(name: "TradeRepublic")
portfolio1 = Portfolio.create!(user: user1, institution: institution1)
asset1 = Asset.create!(portfolio: portfolio1, asset_name: "Hello Fresh", current_unit_price: 63.85, asset_category: "stocks", industry: industries["food"])
acquisition_asset1 = Acquisition.create(asset: asset1, date_bought: "2021-02-15 13:24:20" , units_bought: 10, unit_price_bought: 65.23)
past_pricings_asset1_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 63.20, asset: asset1)
past_pricings_asset1_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 64.20, asset: asset1)
past_pricings_asset1_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 65.20, asset: asset1)
past_pricings_asset1_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 65.20, asset: asset1)
past_pricings_asset1_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 63.20, asset: asset1)
past_pricings_asset1_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 63.20, asset: asset1)
past_pricings_asset1_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 64.20, asset: asset1)
past_pricings_asset1_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 67.20, asset: asset1)
past_pricings_asset1_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 67.20, asset: asset1)
past_pricings_asset1_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 65.20, asset: asset1)
past_pricings_asset1_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 66.20, asset: asset1)
past_pricings_asset1_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 64.20, asset: asset1)
past_pricings_asset1_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 63.20, asset: asset1)
past_pricings_asset1_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 65.20, asset: asset1)
past_pricings_asset1_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 64.20, asset: asset1)
past_pricings_asset1_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 62.20, asset: asset1)
past_pricings_asset1_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 63.20, asset: asset1)
past_pricings_asset1_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 64.20, asset: asset1)
past_pricings_asset1_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 65.20, asset: asset1)
past_pricings_asset1_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 63.20, asset: asset1)
past_pricings_asset1_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 62.20, asset: asset1)
past_pricings_asset1_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 65.20, asset: asset1)
past_pricings_asset1_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 66.20, asset: asset1)

# second seed within Trade Republic

asset2 = Asset.create!(portfolio: portfolio1, asset_name: "Plug Power", current_unit_price: 63.85, asset_category: "stocks", industry: industries["energy"])
acquisition_asset2 = Acquisition.create(asset: asset2, date_bought: "2021-02-15 13:24:20" , units_bought: 50, unit_price_bought: 30.23)
past_pricings_asset2_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 33.20, asset: asset2)
past_pricings_asset2_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 34.20, asset: asset2)
past_pricings_asset2_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 35.20, asset: asset2)
past_pricings_asset2_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 45.20, asset: asset2)
past_pricings_asset2_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 33.20, asset: asset2)
past_pricings_asset2_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 43.20, asset: asset2)
past_pricings_asset2_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 34.20, asset: asset2)
past_pricings_asset2_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 57.20, asset: asset2)
past_pricings_asset2_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 67.20, asset: asset2)
past_pricings_asset2_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 35.20, asset: asset2)
past_pricings_asset2_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 36.20, asset: asset2)
past_pricings_asset2_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 34.20, asset: asset2)
past_pricings_asset2_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 33.20, asset: asset2)
past_pricings_asset2_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 35.20, asset: asset2)
past_pricings_asset2_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 44.20, asset: asset2)
past_pricings_asset2_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 32.20, asset: asset2)
past_pricings_asset2_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 53.20, asset: asset2)
past_pricings_asset2_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 44.20, asset: asset2)
past_pricings_asset2_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 35.20, asset: asset2)
past_pricings_asset2_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 43.20, asset: asset2)
past_pricings_asset2_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 32.20, asset: asset2)
past_pricings_asset2_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 35.20, asset: asset2)
past_pricings_asset2_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 36.20, asset: asset2)

# 3rd seed with Deutsche Bank

portfolio2 = Portfolio.create!(user: user1, institution: institution3)
asset3 = Asset.create!(portfolio: portfolio2, asset_name: "Tesla", current_unit_price: 63.85, asset_category: "stocks", industry: industries["automotive"])
acquisition_asset3 = Acquisition.create(asset: asset3, date_bought: "2021-02-15 13:24:20" , units_bought: 50, unit_price_bought: 30.23)
past_pricings_asset3_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 33.20, asset: asset3)
past_pricings_asset3_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 34.20, asset: asset3)
past_pricings_asset3_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 35.20, asset: asset3)
past_pricings_asset3_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 45.20, asset: asset3)
past_pricings_asset3_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 33.20, asset: asset3)
past_pricings_asset3_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 43.20, asset: asset3)
past_pricings_asset3_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 34.20, asset: asset3)
past_pricings_asset3_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 57.20, asset: asset3)
past_pricings_asset3_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 67.20, asset: asset3)
past_pricings_asset3_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 35.20, asset: asset3)
past_pricings_asset3_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 36.20, asset: asset3)
past_pricings_asset3_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 34.20, asset: asset3)
past_pricings_asset3_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 33.20, asset: asset3)
past_pricings_asset3_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 35.20, asset: asset3)
past_pricings_asset3_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 44.20, asset: asset3)
past_pricings_asset3_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 32.20, asset: asset3)
past_pricings_asset3_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 53.20, asset: asset3)
past_pricings_asset3_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 44.20, asset: asset3)
past_pricings_asset3_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 35.20, asset: asset3)
past_pricings_asset3_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 43.20, asset: asset3)
past_pricings_asset3_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 32.20, asset: asset3)
past_pricings_asset3_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 35.20, asset: asset3)
past_pricings_asset3_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 36.20, asset: asset3)

# 4th seed with Coinbase

portfolio3 = Portfolio.create!(user: user1, institution: institution6)
asset4 = Asset.create!(portfolio: portfolio3, asset_name: "Bitcoin", current_unit_price: 40000, asset_category: "cryptocurrency", industry: industries["cryptocurrency"])
acquisition_asset4 = Acquisition.create(asset: asset4, date_bought: "2021-02-15 13:24:20" , units_bought: 0.2, unit_price_bought: 38000)
past_pricings_asset4_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 40000, asset: asset4)
past_pricings_asset4_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 40000, asset: asset4)
past_pricings_asset4_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 40000, asset: asset4)

# fake seeds 1

portfolio_fake1 = Portfolio.create!(institution: institution2)
asset5 = Asset.create!(portfolio: portfolio_fake1, asset_name: "Hello Fresh", current_unit_price: 63.85, asset_category: "stocks", industry: industries["food"])
acquisition_asset5 = Acquisition.create(asset: asset5, date_bought: "2021-02-15 13:24:20" , units_bought: 10, unit_price_bought: 65.23)
past_pricings_asset1_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 63.20, asset: asset5)
past_pricings_asset1_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 64.20, asset: asset5)
past_pricings_asset1_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 65.20, asset: asset5)
past_pricings_asset1_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 65.20, asset: asset5)
past_pricings_asset1_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 63.20, asset: asset5)
past_pricings_asset1_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 63.20, asset: asset5)
past_pricings_asset1_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 64.20, asset: asset5)
past_pricings_asset1_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 67.20, asset: asset5)
past_pricings_asset1_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 67.20, asset: asset5)
past_pricings_asset1_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 65.20, asset: asset5)
past_pricings_asset1_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 66.20, asset: asset5)
past_pricings_asset1_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 64.20, asset: asset5)
past_pricings_asset1_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 63.20, asset: asset5)
past_pricings_asset1_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 65.20, asset: asset5)
past_pricings_asset1_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 64.20, asset: asset5)
past_pricings_asset1_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 62.20, asset: asset5)
past_pricings_asset1_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 63.20, asset: asset5)
past_pricings_asset1_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 64.20, asset: asset5)
past_pricings_asset1_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 65.20, asset: asset5)
past_pricings_asset1_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 63.20, asset: asset5)
past_pricings_asset1_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 62.20, asset: asset5)
past_pricings_asset1_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 65.20, asset: asset5)
past_pricings_asset1_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 66.20, asset: asset5)

# fake seeds 2

portfolio_fake2 = Portfolio.create!(institution: institution3)
asset6 = Asset.create!(portfolio: portfolio_fake2, asset_name: "Hello Fresh", current_unit_price: 63.85, asset_category: "stocks", industry: industries["food"])
acquisition_asset6 = Acquisition.create(asset: asset6, date_bought: "2021-02-15 13:24:20" , units_bought: 10, unit_price_bought: 65.23)
past_pricings_asset6_1 = PastPricing.create!(date: "2021-02-15 13:24:20", unit_price: 63.20, asset: asset6)
past_pricings_asset6_2 = PastPricing.create!(date: "2021-02-16 13:24:20", unit_price: 64.20, asset: asset6)
past_pricings_asset6_3 = PastPricing.create!(date: "2021-02-17 13:24:20", unit_price: 65.20, asset: asset6)
past_pricings_asset6_4 = PastPricing.create!(date: "2021-02-18 13:24:20", unit_price: 65.20, asset: asset6)
past_pricings_asset6_5 = PastPricing.create!(date: "2021-02-19 13:24:20", unit_price: 63.20, asset: asset6)
past_pricings_asset6_6 = PastPricing.create!(date: "2021-02-20 13:24:20", unit_price: 63.20, asset: asset6)
past_pricings_asset6_7 = PastPricing.create!(date: "2021-02-21 13:24:20", unit_price: 64.20, asset: asset6)
past_pricings_asset6_8 = PastPricing.create!(date: "2021-02-22 13:24:20", unit_price: 67.20, asset: asset6)
past_pricings_asset6_9 = PastPricing.create!(date: "2021-02-23 13:24:20", unit_price: 67.20, asset: asset6)
past_pricings_asset6_10 = PastPricing.create!(date: "2021-02-24 13:24:20", unit_price: 65.20, asset: asset6)
past_pricings_asset6_11 = PastPricing.create!(date: "2021-02-25 13:24:20", unit_price: 66.20, asset: asset6)
past_pricings_asset6_12 = PastPricing.create!(date: "2021-02-26 13:24:20", unit_price: 64.20, asset: asset6)
past_pricings_asset6_13 = PastPricing.create!(date: "2021-02-27 13:24:20", unit_price: 63.20, asset: asset6)
past_pricings_asset6_14 = PastPricing.create!(date: "2021-02-28 13:24:20", unit_price: 65.20, asset: asset6)
past_pricings_asset6_15 = PastPricing.create!(date: "2021-03-01 13:24:20", unit_price: 64.20, asset: asset6)
past_pricings_asset6_16 = PastPricing.create!(date: "2021-03-02 08:00:00", unit_price: 62.20, asset: asset6)
past_pricings_asset6_17 = PastPricing.create!(date: "2021-03-02 10:00:00", unit_price: 63.20, asset: asset6)
past_pricings_asset6_18 = PastPricing.create!(date: "2021-03-02 12:00:00", unit_price: 64.20, asset: asset6)
past_pricings_asset6_19 = PastPricing.create!(date: "2021-03-02 14:00:00", unit_price: 65.20, asset: asset6)
past_pricings_asset6_20 = PastPricing.create!(date: "2021-03-02 16:00:00", unit_price: 63.20, asset: asset6)
past_pricings_asset6_21 = PastPricing.create!(date: "2021-03-02 18:00:00", unit_price: 62.20, asset: asset6)
past_pricings_asset6_22 = PastPricing.create!(date: "2021-03-02 20:00:00", unit_price: 65.20, asset: asset6)
past_pricings_asset6_23 = PastPricing.create!(date: "2021-03-02 22:00:00", unit_price: 66.20, asset: asset6)

# second seed
user2 = User.create!(first_name: "Bella", last_name: "Stad", email: "Bella@example.com", password: "123456")
user3 = User.create!(first_name: "Tom", last_name: "Bell", email: "Tom@example.com", password: "123456")

institutionFaker = Institution.create!(name: "Faker")
portfolioFaker = Portfolio.create!(user: user2, institution: institutionFaker)
assetFaker = Asset.create!(portfolio: portfolioFaker, asset_name: "Bitcoin", current_unit_price: 40, asset_category: "cryptocurrency", industry: industries["cryptocurrency"])
acquisition_assetFaker = Acquisition.create(asset: assetFaker, date_bought: "2020-03-04 00:00:00" , units_bought: 100, unit_price_bought: 20)
acquisition_assetFaker_2 = Acquisition.create(asset: assetFaker, date_bought: "2020-09-04 00:00:00" , units_bought: 150, unit_price_bought: 30)

1000.times do |count|
 
p PastPricing.create!(date: (DateTime.now - count * 1.day), unit_price: rand(40..60), asset: assetFaker)

user1 test seed for more data
end
