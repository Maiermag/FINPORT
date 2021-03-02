class CreatePastPricings < ActiveRecord::Migration[6.0]
  def change
    create_table :past_pricings do |t|
      t.references :asset, null: false, foreign_key: true
      t.float :unit_price
      t.datetime :date

      t.timestamps
    end
  end
end
