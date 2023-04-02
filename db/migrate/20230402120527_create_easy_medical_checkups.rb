class CreateEasyMedicalCheckups < ActiveRecord::Migration[6.1]
  def change
    create_table :easy_medical_checkups do |t|
      t.references :user
      t.decimal :height,              null: false
      t.decimal :weight,              null: false
      t.integer :blood_pressure_up,   null: false
      t.integer :blood_pressure_down, null: false
      t.integer :total_cholesterol,   null: false
      t.integer :hdl_cholesterol,     null: false
      t.integer :ldl_cheolesterol,    null: false
      t.integer :neutral_fat,         null: false
      t.integer :ast,                 null: false
      t.integer :alt,                 null: false
      t.integer :gamma_gtp,           null: false

      t.timestamps
    end
  end
end
