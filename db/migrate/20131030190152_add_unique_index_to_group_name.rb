class AddUniqueIndexToGroupName < ActiveRecord::Migration
  def change
    add_index :group, :name, unique: true
  end
end
