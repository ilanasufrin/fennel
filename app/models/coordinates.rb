module Coordinates

  API_URL = "https://maps.googleapis.com/maps/api/geocode/json?address="

  def get_coordinates_from_location location
    response = JSON.parse Fennel.http.get(API_URL + URI.encode(location)).body
    return nil if response["results"].blank?

    location = response["results"].first.try(:[], "geometry")
    {
      latitude: location["location"]["lat"],
      longitude: location["location"]["lng"],
      precise: ["ROOFTOP", "RANGE_INTERPOLATED"].include?(location["location_type"])
    }
  end

  private
  def location_is_precise
    coords = get_coordinates_from_location(self.location)
    if coords
      self.latitude = coords[:latitude]
      self.longitude = coords[:longitude]
      unless coords[:precise]
        errors.add(:location, "is not precise enough to find your coordinates")
      end
    else
      errors.add(:location, "is not valid!")
    end
  end

end
