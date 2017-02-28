json.array!(@plags) do |plag|
  json.extract! plag, :id
  json.url plag_url(plag, format: :json)
end
