json.array!(@prospective_users) do |prospective_user|
  json.extract! prospective_user, :first_name, :email
  json.url prospective_user_url(prospective_user, format: :json)
end
