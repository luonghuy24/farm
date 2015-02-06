class User
  include Mongoid::Document
	field :name,               type: String
	field :email,							 type: String
  field :gender,             type: String
  field :address,            type: String
  field :numberphone,        type: String
  field :favorite_products,  type: Array, default: []
  field :follow,             type: Boolean
  field :password,					 type: String

end