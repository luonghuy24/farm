class Cart
  include Mongoid::Document
  field :total_cost,				type: Integer
  belongs_to :user
  has_many :items
end