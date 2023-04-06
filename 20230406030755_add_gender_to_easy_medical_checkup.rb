class AddGenderToEasyMedicalCheckup < ActiveRecord::Migration[6.1]
  def change
    add_column :easy_medical_checkups, :gender, :integer,default: 0,null: false
    add_column :easy_medical_checkups, :age, :integer,default: 18,null: false
  end
end
