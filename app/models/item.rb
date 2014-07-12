class Item < ActiveRecord::Base
  has_attached_file :photo, styles: { large: "800x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  has_many :offers

  belongs_to :user
end
