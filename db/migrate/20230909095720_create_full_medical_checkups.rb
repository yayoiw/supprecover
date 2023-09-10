class CreateFullMedicalCheckups < ActiveRecord::Migration[6.1]
  def change
    create_table :full_medical_checkups do |t|
      t.references :user
      t.integer :fasting_blood_sugar, null: false
      t.decimal :hba1c,               null: false
      t.integer :urine_sugar,         null: false
      t.decimal :uric_acid,           null: false
      t.decimal :creatinine,          null: false
      t.decimal :egfr,                null: false
      t.integer :hematocrit,          null: false
      t.integer :hemoglobin,          null: false
      t.integer :rbc,                 null: false
      t.integer :wbc,                 null: false
      t.integer :urine_protein,       null: false
      t.timestamps
    end
  end
end
