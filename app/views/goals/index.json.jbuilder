json.array!(@goals) do |goal|
  json.extract! goal, :hotspot_id, :time
  json.url goal_url(goal, format: :json)
end
