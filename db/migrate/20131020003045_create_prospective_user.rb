class CreateProspectiveUser < ActiveRecord::Migration
  def change
    create_table :prospective_user do |t|
      t.string :first_name, null: false
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
