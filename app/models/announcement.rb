class Announcement < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :restaurant_name, :user
  before_save -> { user.announcements.for_today.destroy_all }

  scope :for_today, -> {
    where("announcement.created_at >= ?", Time.zone.now.beginning_of_day)
  }

  scope :visible_to, -> (user) {
    conditions = { "group_membership.group_id" => user.groups.map(&:id) }
    (user.announcements + joins(user: :group_memberships).where(conditions)).uniq
  }

  def to_s
    "#{user.best_identifier} wants to go to #{restaurant_name}"
  end
end
