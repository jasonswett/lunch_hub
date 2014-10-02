class CreateAnnouncement < ActiveRecord::Migration
  def change
    create_table :announcement do |t|
      t.references :user, index: true, null: false
      t.string :restaurant_name, null: false

      t.timestamps
    end

    add_foreign_key :announcement, :user
  end
end
