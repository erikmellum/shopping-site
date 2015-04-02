json.array!(@hobbies) do |hobby|
  json.extract! hobby, :id, :name, :description
  json.url hobby_url(hobby, format: :json)
end
