class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :total_cost, type: Integer
  enum :status, [:saved, :pending], default: "pending"

  belongs_to :user
  has_many :items
  accepts_nested_attributes_for :items
end