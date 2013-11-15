class CreateAddress < ActiveRecord::Migration
  def change
    create_table :address do |t|
      t.string :line1, required: true, default: ""
      t.string :line2, required: true, default: ""
      t.string :city, required: true, default: ""
      t.references :state, index: true, required: true
      t.string :zip, required: true, default: ""

      t.timestamps
    end

    add_index :address, [:line1, :line2, :city, :state_id, :zip], unique: true
  end
end
