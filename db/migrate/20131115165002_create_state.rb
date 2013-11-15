class CreateState < ActiveRecord::Migration
  def change
    create_table :state do |t|
      t.string :name, required: true, default: ""
      t.string :abbreviation, required: true, default: ""

      t.timestamps
    end

    add_index :state, :name, unique: true
  end
end
