json.array!(@user_role_relationships) do |user_role_relationship|
  json.extract! user_role_relationship, :id, :user_id, :role_id
  json.url user_role_relationship_url(user_role_relationship, format: :json)
end
