class Cart
  include Mongoid::Document
  field :total_cost,				type: Integer
  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items
end