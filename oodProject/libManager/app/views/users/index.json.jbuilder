json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :ty, :age, :sex, :pnum
  json.url user_url(user, format: :json)
end
