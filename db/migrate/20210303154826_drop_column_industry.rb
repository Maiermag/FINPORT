class DropColumnIndustry < ActiveRecord::Migration[6.0]
  def change
    change_table :assets do |t|
      t.remove :industry
    end
  end
end
