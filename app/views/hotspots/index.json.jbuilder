json.array!(@hotspots) do |hotspot|
  json.extract! hotspot, :location, :length, :avg_incline
  json.url hotspot_url(hotspot, format: :json)
end
