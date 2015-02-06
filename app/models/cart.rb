class Cart
  include Mongoid::Document
  field :product_name,			type: String
  field :product_code,			type: String
  field :total_cost,				type: Integer
end