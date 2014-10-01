class Announcement < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :restaurant_name, :user

  scope :for_today, -> {
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  }

  def to_s
    "#{user.email} wants to go to #{restaurant_name}"
  end
end
