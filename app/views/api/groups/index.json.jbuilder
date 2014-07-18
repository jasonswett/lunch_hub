json.array!(@groups) do |group|
  json.extract! group, :id, :name, :description
  json.url api_group_url(group, format: :json)
end
