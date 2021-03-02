class CreateAcquisitions < ActiveRecord::Migration[6.0]
  def change
    create_table :acquisitions do |t|
      t.references :asset, null: false, foreign_key: true
      t.datetime :date_bought
      t.float :units_bought
      t.float :unit_price_bought
      t.string :api_json

      t.timestamps
    end
  end
end
