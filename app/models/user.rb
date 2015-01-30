class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  has_many :announcements
  has_many :group_memberships
  has_many :groups, through: :group_memberships
  validates :email, uniqueness: { case_sensitive: false }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save -> do
    self.uid = SecureRandom.uuid
    skip_confirmation!
  end

  def best_identifier
    name ? name : email
  end

  def as_json(options = {})
    super(options).merge("group_ids" => groups.collect(&:id))
  end
end
