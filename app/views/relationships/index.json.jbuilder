json.array!(@relationships) do |relationship|
  json.extract! relationship, :id, :name
  json.url relationship_url(relationship, format: :json)
end
