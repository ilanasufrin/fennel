class User < ActiveRecord::Base
  include Coordinates
  validate :location_is_precise

  # Phone number: /\d+{10}/, allow blank, remove dashes

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
    user = new(
      provider: auth["provider"],
      uid: auth["uid"],
      name: auth["info"]["name"],
      email: auth["info"]["email"]
    )
    user.save(validate: false)
    user
  end
end
