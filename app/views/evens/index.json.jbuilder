json.array!(@evens) do |even|
  json.extract! even, :id, :number
  json.url even_url(even, format: :json)
end
