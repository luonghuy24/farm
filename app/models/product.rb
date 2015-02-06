class Product
  include Mongoid::Document
	field :product_name,							type: String
	field :product_code,			type: String
	field :description,				type: String
	field :standard,					type: String

	field :production_date, 	type: DateTime
	field :expiry_date,				type: DateTime
	field :harvest_date,			type: DateTime
	field :output,						type: Integer
	field :stock,							type: Integer
	field :price,							type: Integer
end