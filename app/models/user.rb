class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save -> do
    self.uid = SecureRandom.uuid
  end

  def confirmed?
    true
  end

  def send_confirmation_instructions(attributes)
    # Do nothing because we're not :confirmable.
  end
end
