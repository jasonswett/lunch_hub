class CreateGroup < ActiveRecord::Migration
  def change
    create_table :group do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""

      t.timestamps
    end
  end
end
