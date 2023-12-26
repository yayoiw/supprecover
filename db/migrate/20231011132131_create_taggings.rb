class CreateTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :easy_medical_checkup, null: false, foreign_key: true
      t.references :full_medical_checkup, null: true, foreign_key: true

      t.timestamps
    end
  end
end
