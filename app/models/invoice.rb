class Invoice < ApplicationRecord

  has_many :customers
  has_many :line_items, dependent: :destroy
  accepts_nested_attributes_for :line_items

  belongs_to :organization
  accepts_nested_attributes_for :organization

end
