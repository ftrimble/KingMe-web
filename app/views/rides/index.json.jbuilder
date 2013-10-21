json.array!(@rides) do |ride|
  json.extract! ride, :id, :name, :location
  json.url ride_url(ride, format: :json)
end
