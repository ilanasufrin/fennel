class Matcher
  DELTA = 0.002

  def match_user_to_available_item(user)
    lat = user.latitude
    lng = user.longitude
    item = Item.available
      .where('latitude BETWEEN ? AND ?', lat-DELTA, lat+DELTA)
      .where('longitude BETWEEN ? AND ?', lng-DELTA, lng+DELTA)
    if item
      item.offers.create!(owner: item.user, recipient: user)
    end
  end

  def match_item_to_available_user(item)
    lat = item.latitude
    lng = item.longitude
    user = User.without_offer
      .where('latitude BETWEEN ? AND ?', lat-DELTA, lat+DELTA)
      .where('longitude BETWEEN ? AND ?', lng-DELTA, lng+DELTA)
    if user
      item.offers.create!(owner: item.user, recipient: user)
    end
  end
end
