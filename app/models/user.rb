class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  has_many :announcements

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save -> do
    self.uid = SecureRandom.uuid
    skip_confirmation!
  end
end
