json.array!(@events) do |event|
  json.extract! event, :id, :name, :location, :date
  json.url event_url(event, format: :json)
end
