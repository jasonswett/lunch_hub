json.extract! @announcement, :user_id, :restaurant_name, :created_at, :updated_at
json.description @announcement.to_s
