class Announcement < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :restaurant_name, :user

  def to_s
    "#{user.email} wants to go to #{restaurant_name}"
  end
end
