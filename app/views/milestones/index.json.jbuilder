json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :date, :description, :name
  json.url milestone_url(milestone, format: :json)
end
