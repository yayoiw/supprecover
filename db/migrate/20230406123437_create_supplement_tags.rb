class CreateSupplementTags < ActiveRecord::Migration[6.1]
  def change
    create_table :supplement_tags do |t|
      t.references :supplement, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
