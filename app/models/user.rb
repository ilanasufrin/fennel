class User < ActiveRecord::Base
  # :email, :name, :location, :provider, :uid, :phone_number

  # Phone number: /\d+{10}/, allow blank, remove dashes

  has_many :items,
    class_name: "Item"

  has_many :received_offers,
    class_name: "Offer"

  has_many :offers,
    class_name: "Offer"

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
end
