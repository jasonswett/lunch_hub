json.array!(@groups) do |group|
  json.extract! group, :name, :description
  json.url group_url(group, format: :json)
end
