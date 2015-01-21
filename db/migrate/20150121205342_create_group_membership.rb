class CreateGroupMembership < ActiveRecord::Migration
  def change
    create_table :group_membership do |t|
      t.references :user, index: true, null: false
      t.references :group, index: true, null: false

      t.timestamps
    end

    add_foreign_key :group_membership, :user
    add_foreign_key :group_membership, :group
    add_index :group_membership, [:user_id, :group_id], unique: true
  end
end
