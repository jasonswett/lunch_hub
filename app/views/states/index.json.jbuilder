json.array!(@states) do |state|
  json.extract! state, :name, :abbreviation
  json.url state_url(state, format: :json)
end
