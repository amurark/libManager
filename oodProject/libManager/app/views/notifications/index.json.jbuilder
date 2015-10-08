json.array!(@notifications) do |notification|
  json.extract! notification, :id, :ISBN, :email
  json.url notification_url(notification, format: :json)
end
