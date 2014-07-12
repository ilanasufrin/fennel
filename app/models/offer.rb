class Offer < ActiveRecord::Base
  enum status: [:open, :pending, :accepted, :rejected]

  belongs_to :item

  belongs_to :owner,
    class_name: "User"

  belongs_to :recipient,
    class_name: "User"
end
