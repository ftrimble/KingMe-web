module RidesHelper
  def google_maps_api_key
   "AIzaSyAWbUG52HjXESqXykChQYtMTD7y9Ta6H1E"
  end

  def google_api_url
    "http://maps.googleapis.com/maps/api/js"
  end

  def google_api_access
    "#{google_api_url}?key=#{google_maps_api_key}&libraries=geometry&sensor=false"
    #"https://maps.googleapis.com/maps/api/js?sensor=true"
  end

  def google_maps_api
    content_tag(:script,:type => "text/javascript",:src => google_api_access) do
    end
  end

end
