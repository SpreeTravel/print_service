class Organization < ApplicationRecord

  has_many :invoice
  has_many :customer

  validates_presence_of :name, :country, :currency, :time_zone
  validates :logo, attachment_presence: true


  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
