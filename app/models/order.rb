class Order
  include Mongoid::Document
  field :total_cost, type: Integer
  field :order_time, type: DateTime

  belongs_to :user
  has_many :items
end