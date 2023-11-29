class RemoveUniqueIndexFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :name
    add_index :users, :name
  end
end
