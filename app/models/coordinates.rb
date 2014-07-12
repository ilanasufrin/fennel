module Coordinates

  API_URL = "https://maps.googleapis.com/maps/api/geocode/json?address="

  def get_coordinates_from_location location
    response = Fennel.http.get(API_URL + URI.encode(location)).body
    location = JSON.parse(response)
      .try(:[], "results")
      .try(:first)
      .try(:[], "geometry")

    if ["ROOFTOP", "RANGE_INTERPOLATED"].include? location["location_type"]
      {
        latitude: location["location"]["lat"],
        longitude: location["location"]["lng"]
      }
    else
      nil
    end
  end

end
