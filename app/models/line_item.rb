class LineItem < ActiveRecord::Base

  belongs_to :invoice
  accepts_nested_attributes_for :invoice

end
