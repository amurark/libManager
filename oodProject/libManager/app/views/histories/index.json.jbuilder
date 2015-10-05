json.array!(@histories) do |history|
  json.extract! history, :id, :book_isbn, :user_email, :checkout_time, :return_time
  json.url history_url(history, format: :json)
end
