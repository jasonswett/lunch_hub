class RemoveConfirmableColumnsFromUser < ActiveRecord::Migration
  def change
    change_table :user do |t|
      t.remove(
        :confirmation_token,
        :confirmed_at,
        :confirmation_sent_at,
        :confirm_success_url,
        :unconfirmed_email
      )
    end
  end
end
