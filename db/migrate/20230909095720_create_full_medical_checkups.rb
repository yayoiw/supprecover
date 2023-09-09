class CreateFullMedicalCheckups < ActiveRecord::Migration[6.1]
  def change
    create_table :full_medical_checkups do |t|

      t.timestamps
    end
  end
end
