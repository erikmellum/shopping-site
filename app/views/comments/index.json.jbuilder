json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :body, :date
  json.url comment_url(comment, format: :json)
end
