json.array!(@books) do |book|
  json.extract! book, :id, :ISBN, :Title, :Authors, :Description, :Status, :Lastuser, :Datetime
  json.url book_url(book, format: :json)
end
