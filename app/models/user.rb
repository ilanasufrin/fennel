class User < ActiveRecord::Base
  include Coordinates
  # :email, :name, :location, :provider, :uid, :phone_number

  # Phone number: /\d+{10}/, allow blank, remove dashes

  validate :location_is_precise

  has_many :items

  has_many :received_offers,
    class_name: "Offer",
    foreign_key: :recipient_id

  has_many :offers,
    class_name: "Offer",
    foreign_key: :owner_id

  before_create -> user { user.session_token = SecureRandom.base64 }

  def self.from_omniauth(auth)
    User.where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
    end
  end

  private
  def location_is_precise
    coords = get_coordinates_from_location(self.location)
    if coords
      self.latitude = coords[:latitude]
      self.longitude = coords[:longitude]
    else
      errors.add(:location, "is not precise enough to find your coordinates")
    end
  end
end
