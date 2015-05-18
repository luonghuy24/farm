class Product
	include Mongoid::Document
  include Mongoid::Search
	validates_presence_of :product_name, :product_code, :description, :price

	field :product_name,			type: String
	field :product_code,			type: String
	field :description,				type: String
	field :standard,					type: String
	field :type, 							type: Array
	# %w(rau\ sạch củ quả thịt hạt hạt\ giống gia\ vị  )

	field :production_date, 	type: DateTime
	field :expiry_date,				type: DateTime
	field :harvest_date,			type: DateTime
	field :output,						type: Integer
	field :stock,							type: Integer
	field :price,							type: Integer
	mount_uploader :image, ImageUploader

	has_many :favorites
	belongs_to :item
	
	search_in :product_code, :product_name, :type_array, :standard, :description 

end
