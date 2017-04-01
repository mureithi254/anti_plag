json.array!(@results) do |result|
  json.extract! result, :id
  json.url result_url(result, format: :json)
end
