json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :image_id
  json.url tag_url(tag, format: :json)
end
