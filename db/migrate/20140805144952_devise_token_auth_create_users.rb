class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    drop_table(:user)

    create_table(:user) do |t|
      ## Database authenticatable
      t.string :email
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.string   :reset_password_redirect_url

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :confirm_success_url
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string :name
      t.string :nickname
      t.string :image

      ## unique oauth id
      t.string :provider
      t.string :uid, :null => false, :default => ""

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :user, :email
    add_index :user, :uid,                  :unique => true
    add_index :user, :reset_password_token, :unique => true
    # add_index :user, :confirmation_token,   :unique => true
    # add_index :user, :unlock_token,         :unique => true
  end
end
