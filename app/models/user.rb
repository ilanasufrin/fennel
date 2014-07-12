class User < ActiveRecord::Base
  # :email, :name, :location, :provider, :uid, :phone_number

  # Phone number: /\d+{10}/, allow blank, remove dashes

  has_many :items

  has_many :received_offers,
    class_name: "Offer",
    foreign_key: :recipient_id

  has_many :offers,
    class_name: "Offer",
    foreign_key: :owner_id

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
