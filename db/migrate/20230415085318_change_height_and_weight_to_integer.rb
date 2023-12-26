class ChangeHeightAndWeightToInteger < ActiveRecord::Migration[6.1]
  def up
    change_column :easy_medical_checkups, :height, :integer
    change_column :easy_medical_checkups, :weight, :integer
  end

  def down
    change_column :easy_medical_checkups, :height, :decimal
    change_column :easy_medical_checkups, :weight, :decimal
  end
end
