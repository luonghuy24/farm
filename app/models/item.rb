class Item
  include Mongoid::Document

	field :quantity, type: Integer
	field :cost, type: Integer

	has_one :product

	belongs_to :user
	belongs_to :cart
	belongs_to :order

end