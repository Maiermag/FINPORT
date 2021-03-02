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
Acquisition.destroy_all
PastPricing.destroy_all

# first seed
user1 = User.create!(first_name: "Jonas", last_name: "Mikael", email: "Jonas@example.com", password: "123456")
institution1 = Institution.create!(name: "TradeRepublic")
portfolio1 = Portfolio.create!(user: user1, institution: institution1)
asset1 = Asset.create!(portfolio: portfolio1, asset_name: "Hello Fresh", current_unit_price: 63.85, asset_category: "share", industry: "food")
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

#institutions seed

institution2 = Institution.create!(name: "Scalable Capital")
institution3 = Institution.create!(name: "Sparkasse")
institution4 = Institution.create!(name: "Bitpanda")
institution5 = Institution.create!(name: "Deutsche Bank")
institution6 = Institution.create!(name: "Coinbase")
institution7 = Institution.create!(name: "N26")
institution8 = Institution.create!(name: "Revolut")

# second seed
user2 = User.create!(first_name: "Bella", last_name: "Stad", email: "Bella@example.com", password: "123456")
user3 = User.create!(first_name: "Tom", last_name: "Bell", email: "Tom@example.com", password: "123456")
