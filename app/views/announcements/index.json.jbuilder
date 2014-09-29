json.array!(@announcements) do |announcement|
  json.extract! announcement, :user_id, :restaurant_name
  json.description announcement.to_s
  json.url announcement_url(announcement, format: :json)
end
