class AddReferenceToIndustry < ActiveRecord::Migration[6.0]
  def change
    change_table :assets do |t|
      t.references :industry
    end
  end
end
