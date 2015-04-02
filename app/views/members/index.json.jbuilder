json.array!(@members) do |member|
  json.extract! member, :id, :name, :description, :dob
  json.url member_url(member, format: :json)
end
