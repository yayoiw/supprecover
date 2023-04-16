class RemoveColumnFromEasyMedicalCheckup < ActiveRecord::Migration[6.1]
  def change
    remove_column :easy_medical_checkups, :age, :integer
    remove_column :easy_medical_checkups, :gender, :integer
  end
end
