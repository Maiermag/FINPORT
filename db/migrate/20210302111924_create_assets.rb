class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.string :asset_name
      t.float :current_unit_price
      t.string :asset_category
      t.references :portfolio, null: false, foreign_key: true
      t.string :industry

      t.timestamps
    end
  end
end
